<template>
  <div id="data_container">
    <div style="width: 40%;height: 100%;box-sizing: border-box;">
      <el-form label-width="120px">
        <el-form-item label="分析需求">
          <el-input type="textarea" v-model="dataForm.goal" placeholder="请输入分析需求"></el-input>
        </el-form-item>
        <el-form-item  style="margin-top: 20px"  label="标题">
          <el-input v-model="dataForm.name" placeholder="请输入标题"></el-input>
        </el-form-item>
        <el-form-item  style="margin-top: 20px"  label="图形类别">
          <el-select v-model="dataForm.chartType" placeholder="请选择图形类别">
            <el-option label="柱状图" value="柱状图"></el-option>
            <el-option label="折线图" value="折线图"></el-option>
            <el-option label="散点图" value="散点图"></el-option>
            <el-option label="饼图" value="饼图"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item  style="margin-top: 20px"  label="上传文件">
          <el-upload
              v-model:file-list="fileList"
              class="upload-demo"
              action=""
              :http-request="uploadFile"
          >
            <el-button style="margin-top: 0px"   type="primary">
              <div style="display: flex">
                <div style=""><el-icon><UploadFilled /></el-icon></div>
                <div style="margin-left: 5px;;letter-spacing: 2px;display: flex;justify-content: center;align-items: center">
                  <div style="">点击上传</div>
                </div>
              </div>
            </el-button>
            <template #tip>
              <div class="el-upload__tip">
                xls/xlsx 文件小于 1MB.
              </div>
            </template>
          </el-upload>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">AI生成</el-button>
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div style="width: 58%;height: 100%;box-sizing: border-box;padding: 0 3.75rem 3.75rem 3.75rem;">

      <div style="width: 100%; height: 25vh;">
        <div style="font-size: 1.25rem;font-weight: bold;">
         AI数据预览
        </div>
        <div style="display: flex;width: 100%;height: 100%">
          <img style="margin: auto;width: 25%;height: 70%;" v-if="!data" :src="'https://img.picui.cn/free/2024/09/03/66d72d45ab50c.png'" alt="" />
          <div style="margin-top: 0.75rem;overflow: hidden;letter-spacing: 0.11rem;line-height: 1.5rem;font-size: 0.85rem" v-else>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            {{ data }}
          </div>
        </div>
      </div>
      <div  style="width: 100%; height: 60vh;margin-top: 5vh">
        <div style="font-size: 1.25rem;font-weight: bold;">
          AI图表预览
        </div>
        <div v-loading="loading"
             element-loading-text="AI服务有点慢哦，加载中..."
             :element-loading-spinner="svg"
             element-loading-custom-class="svg-loading"
             element-loading-svg-view-box="-10, -10, 50, 50" style="width: 100%;margin-top: 10px;border-radius: 15px;background-color: #f3f3f3;height: 55vh;display: flex;justify-content: center;align-items: center">
          <v-chart style="margin-top: 30px;width: 90%" :option="option.value" autoresize />
        </div>
      </div>
    </div>
  </div>

</template>

<script setup>
import * as echarts from 'echarts';
import {ElMessage} from "element-plus";
import instance from "../api/request.js";
import {UploadFilled} from "@element-plus/icons-vue";
import { use } from 'echarts/core';
import { CanvasRenderer } from 'echarts/renderers';
import { PieChart } from 'echarts/charts';
import {
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  GridComponent,
} from 'echarts/components';
import VChart, { THEME_KEY } from 'vue-echarts';
import {ref, provide,  reactive} from 'vue';
import { BarChart } from 'echarts/charts';
echarts.use([BarChart]);
use([
  CanvasRenderer,
  PieChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent,
  GridComponent,
]);

provide(THEME_KEY, '');

const option = reactive({});

const loading = ref(false)

const data = ref(null)

const svg = `
        <path class="path" d="
          M 30 15
          L 28 17
          M 25.61 25.61
          A 15 15, 0, 0, 1, 15 30
          A 15 15, 0, 1, 1, 27.99 7.5
          L 15 15
        " style="stroke-width: 4px; fill: rgba(0, 0, 0, 0)"/>
      `

// 表单数据
const dataForm = reactive({
  goal: '',
  name: '',
  chartType: '',
  file:''
})

const uploadFile = (v) => {
  console.log(v)
  dataForm.file = v.file
}

// 文件上传相关
const fileList = ref([]);


// 提交表单
const submitForm = () => {
  loading.value = true
  console.log(dataForm)
  let formData1 = new FormData();
  formData1.append("file", dataForm.file);
  formData1.append("name", dataForm.name);
  formData1.append("goal", dataForm.goal);
  formData1.append("chartType", dataForm.chartType);
  console.log(formData1)
  let config = {
    headers: {
      "Content-Type": "multipart/form-data",
    }
  }
  instance.post('/chart/gen',formData1,config).then( res => {
    if (res.data.code === 0){
      console.log(res.data)
      data.value = res.data.data.genResult
      console.log(data.value)
      const string = res.data.data.genChart;
      try {
        const str = string.replace(/'/g, '"');
        option.value = JSON.parse(str);
      } catch (e) {
        ElMessage({
          message: 'AI生成失败',
          type: 'error'
        })
      }
      loading.value = false
      ElMessage({
        message: 'AI分析成功',
        type: 'success'
      })
      resetForm()
    }
  })

}

// 重置表单
const resetForm = () => {
  dataForm.goal = '';
  dataForm.name = '';
  dataForm.chartType = '';
  fileList.value = []
};
</script>

<style scoped lang="scss">
#data_container{
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: space-between;
  box-sizing: border-box;
  padding: 3.75rem 3.75rem 3.75rem 3.75rem;
}
.svg-loading{
  width: 50px;
  height: 50px;
}
</style>