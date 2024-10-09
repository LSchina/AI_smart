package com.bi.aibi.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bi.aibi.manager.AiManager;
import com.bi.aibi.manager.RedisLimiterManager;
import com.bi.aibi.model.chart.ChartAddRequest;
import com.bi.aibi.model.chart.ChartQueryRequest;
import com.bi.aibi.model.chart.GenChartAiRequest;
import com.bi.aibi.model.dto.PageDTO;
import com.bi.aibi.model.entity.Chart;
import com.bi.aibi.common.BaseResponse;
import com.bi.aibi.common.DeleteRequest;
import com.bi.aibi.common.ErrorCode;
import com.bi.aibi.common.ResultUtils;
import com.bi.aibi.exception.BusinessException;
import com.bi.aibi.exception.ThrowUtils;
import com.bi.aibi.model.entity.User;
import com.bi.aibi.model.vo.BiResponse;
import com.bi.aibi.service.ChartService;
import com.bi.aibi.service.UserService;
import javax.servlet.http.HttpServletRequest;

import com.bi.aibi.utils.ExcelUtils;
import com.bi.aibi.utils.StringUtils;
import com.bi.aibi.utils.UserContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.List;

/**
 * 帖子接口
 */
@RestController
@RequestMapping("/chart")
@Slf4j
@RequiredArgsConstructor
public class ChartController {

    private final AiManager aiManager;

    private final UserService userService;

    private final ChartService chartService;
    // region 增删改查

    private final RedisLimiterManager redisLimiterManager;

    /**
     * 创建
     *
     * @param chartAddRequest
     * @param request
     * @return
     */
    @PostMapping("/add")
    public BaseResponse<Long> addPost(@RequestBody ChartAddRequest chartAddRequest, HttpServletRequest request) {
        if (chartAddRequest == null) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        Chart chart = new Chart();
        BeanUtils.copyProperties(chartAddRequest, chart);
        User loginUser = userService.getLoginUser(request);
        chart.setUserId(loginUser.getId());
        boolean result = chartService.save(chart);
        ThrowUtils.throwIf(!result, ErrorCode.OPERATION_ERROR);
        long newPostId = chart.getId();
        return ResultUtils.success(newPostId);
    }

    /**
     * 删除
     *
     * @param deleteRequest
     * @param request
     * @return
     */
    @PostMapping("/delete")
    public BaseResponse<Boolean> deletePost(@RequestBody DeleteRequest deleteRequest, HttpServletRequest request) {
        if (deleteRequest == null || deleteRequest.getId() <= 0) {
            throw new BusinessException(ErrorCode.PARAMS_ERROR);
        }
        User user = userService.getLoginUser(request);
        long id = deleteRequest.getId();
        // 判断是否存在
        Chart oldChart = chartService.getById(id);
        ThrowUtils.throwIf(oldChart == null, ErrorCode.NOT_FOUND_ERROR);
        // 仅本人或管理员可删除
        if (!oldChart.getUserId().equals(user.getId()) && !userService.isAdmin(request)) {
            throw new BusinessException(ErrorCode.NO_AUTH_ERROR);
        }
        boolean b = chartService.removeById(id);
        return ResultUtils.success(b);
    }


    /**
     * 智能分析
     *
     * @param multipartFile
     * @param genChartAiRequest
     * @return
     */
    @PostMapping("/gen")
    public BaseResponse<BiResponse> getChartAi(
            @RequestPart("file") MultipartFile multipartFile,
            GenChartAiRequest genChartAiRequest) {
        String name = genChartAiRequest.getName();
        String goal = genChartAiRequest.getGoal();
        String chartType = genChartAiRequest.getChartType();

        ThrowUtils.throwIf(StringUtils.isBlank(goal), ErrorCode.PARAMS_ERROR,"目标为空");
        ThrowUtils.throwIf(StringUtils.isNotBlank(name) && name.length() > 100, ErrorCode.PARAMS_ERROR,"名称过长");

        //校验文件
        //获取文件大小
        long size = multipartFile.getSize();
        //获取文件名称
        String originalFilename = multipartFile.getOriginalFilename();
        /**
         * （1）校验文件大小
         * 定义1MB大小
         */
        final long ONE_MB = 1024*1024L;
        //比较文件大小
        ThrowUtils.throwIf(size > ONE_MB, ErrorCode.PARAMS_ERROR,"文件超过1MB");

        /**
         * 校验文件后缀
         */
        String suffix = FileUtil.getSuffix(originalFilename);
        final List<String> validSuffix = Arrays.asList("xls", "xlsx");
        ThrowUtils.throwIf(!validSuffix.contains(suffix), ErrorCode.PARAMS_ERROR,"文件后缀非法");

        //限流操作，防止俺老李没钱啊，呀吼
        Long userId = UserContext.getUser();
        redisLimiterManager.daRateLimter(userId.toString());

        StringBuilder userInput = new StringBuilder();
        String  userGoal = goal;
        //类型拼接
        if (StringUtils.isNotBlank(chartType)){
            userGoal += ",请使用" + chartType;
        }
        userInput.append("分析需求：").append(userGoal).append("\n");
        String result = ExcelUtils.excelToCsv(multipartFile);
        userInput.append("原始数据：").append("\n").append(result).append("\n");


        //使用AI生成数据，并进行处理
        String AiData = aiManager.doChat(userInput.toString());
        String[] split = AiData.split("【【【【【");
        if (split.length < 3){
            throw new BusinessException(ErrorCode.PARAMS_ERROR,"AI分析失败");
        }
        String genChart = split[1].trim();
        String genResult = split[2].trim();
        Chart chart = new Chart();
        chart.setGoal(goal);
        chart.setChartType(chartType);
        chart.setChartData(result);
        chart.setGenChart(genChart);
        chart.setGenResult(genResult);
        chart.setUserId(userId);
        chart.setName(name);
        chartService.save(chart);
        BiResponse biResponse = new BiResponse();
        biResponse.setGenChart(genChart);
        biResponse.setGenResult(genResult);
        biResponse.setChartId(chart.getId());
        log.info("{}",biResponse);
        return ResultUtils.success(biResponse);
    }

    @PostMapping("/chartList")
    public BaseResponse<PageDTO<Chart>> chartList(@RequestBody ChartQueryRequest request){
        Long userId = UserContext.getUser();
        Page<Chart> page = chartService.lambdaQuery().eq(Chart::getUserId,userId)
                .like(StringUtils.isNotBlank(request.getName()),Chart::getName,request.getName())
                .page(request.toMpPage("createTime",false));
        if (CollUtil.isEmpty(page.getRecords())){
            return ResultUtils.success(null);
        }
        return ResultUtils.success(PageDTO.of(page));
    }

}
