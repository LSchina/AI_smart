/*
 Navicat Premium Data Transfer

 Source Server         : ds
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : ai_bi

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 09/10/2024 20:13:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `appName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `appDesc` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用描述',
  `appIcon` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '应用图标',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `reviewStatus` int NOT NULL DEFAULT 0 COMMENT '审核状态：0-待审核, 1-通过, 2-拒绝',
  `reviewMessage` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核信息',
  `reviewerId` bigint NULL DEFAULT NULL COMMENT '审核人 id',
  `reviewTime` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appName`(`appName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app
-- ----------------------------

-- ----------------------------
-- Table structure for chart
-- ----------------------------
DROP TABLE IF EXISTS `chart`;
CREATE TABLE `chart`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `goal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '分析目标',
  `chartType` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图表类型',
  `chartData` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图表数据',
  `genChart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '生成的图表数据',
  `genResult` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '生成的分析结果',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图表名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1836293976601153537 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图标信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chart
-- ----------------------------
INSERT INTO `chart` VALUES (1831472099894517762, '分析日活增长趋势', '饼图', '日期,日活\n1,12\n2,15\n3,13\n4,20\n5,25\n', '{\n  \"title\": {\n    \"text\": \'日活增长趋势分析\',\n    \"subtext\": \'\',\n    \"left\": \'center\'\n  },\n  \"tooltip\": {\n    \"trigger\": \'item\'\n  },\n  \"legend\": {\n    \"orient\": \'vertical\',\n    \"left\": \'left\'\n  },\n  \"series\": [\n    {\n      \"name\": \'日活\',\n      \"type\": \'pie\',\n      \"radius\": \'50%\',\n      \"data\": [\n        {\"value\": 12, \"name\": \'第1天\'},\n        {\"value\": 15, \"name\": \'第2天\'},\n        {\"value\": 13, \"name\": \'第3天\'},\n        {\"value\": 20, \"name\": \'第4天\'},\n        {\"value\": 25, \"name\": \'第5天\'}\n      ],\n      \"emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \'rgba(0, 0, 0, 0.5)\'\n        }\n      }\n    }\n  ]\n}', '根据数据分析，日活用户在前五天内呈现增长趋势，特别是在第4天和第5天增长较为显著。具体来看，第1天的日活为12人，第2天增长到15人，第3天略有下降到13人，第4天显著增长到20人，第5天继续增长到25人。这表明可能有某些因素在第4天和第5天促进了用户的活跃度，建议进一步分析这些因素，以便制定策略保持和增强日活增长趋势。', 1824713159655571457, '2024-09-05 07:19:10', '2024-09-05 07:19:10', 0, '趋势图');
INSERT INTO `chart` VALUES (1831474483253239809, '分析一年之间员工薪水状况', '饼图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \'一年内员工薪水状况分析\',\n    \"subtext\": \'\',\n    \"left\": \'center\'\n  },\n  \"tooltip\": {\n    \"trigger\": \'item\'\n  },\n  \"legend\": {\n    \"orient\": \'vertical\',\n    \"left\": \'left\'\n  },\n  \"series\": [\n    {\n      \"name\": \'薪水\',\n      \"type\": \'pie\',\n      \"radius\": \'50%\',\n      \"data\": [\n        {\"value\": 1100, \"name\": \'aa\'},\n        {\"value\": 1500, \"name\": \'bb\'},\n        {\"value\": 2000, \"name\": \'cc\'},\n        {\"value\": 5000, \"name\": \'dd\'},\n        {\"value\": 4200, \"name\": \'ee\'},\n        {\"value\": 3000, \"name\": \'ff\'},\n        {\"value\": 1300, \"name\": \'gg\'},\n        {\"value\": 4300, \"name\": \"hh\"},\n        {\"value\": 6600, \"name\": \"ii\"},\n        {\"value\": 2000, \"name\": \"jj\"},\n        {\"value\": 3000, \"name\": \"kk\"},\n        {\"value\": 1000, \"name\": \"ll\"}\n      ],\n      \"emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \'rgba(0, 0, 0, 0.5)\'\n        }\n      }\n    }\n  ]\n}', '根据数据分析，我们可以得出以下结论：\n\n- 员工ii的薪水最高，为6600元，这可能意味着他的职位较高或者工作表现突出。\n- 员工ll的薪水最低，为1000元，这可能反映了他的职位较低或者工作经验不足。\n- 薪水分布中，有两位员工（cc和jj）的薪水为2000元，四位员工（aa，bb，gg和ll）的薪水在1000到2000元之间，四位员工（ff，ee，hh和kk）的薪水在3000到5000元之间，另外两位员工（dd和ii）的薪水超过5000元。\n- 整体来看，员工的薪水分布比较平均，没有出现极端的高薪或低薪情况。\n\n这些数据可以帮助管理层了解员工的薪资结构，并据此调整薪酬政策，以保持员工的积极性和竞争力。', 1824713159655571457, '2024-09-05 07:28:38', '2024-09-05 07:28:38', 0, '企业薪水情况');
INSERT INTO `chart` VALUES (1831474626325143554, '分析一年之间员工薪水状况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工薪水状况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"bar\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '根据数据分析，我们可以得出以下结论：\n\n- 员工薪水在一年内波动较大，最高薪为6600元，最低薪为1000元。\n- 四月和九月的员工薪水最高，分别为5000元和6600元，这可能反映了这两个月员工的绩效或者工作量较大。\n- 一月和十二月的员工薪水最低，这可能是因为这两个月通常是年度的开始和结束，公司可能在这段时间进行薪资调整或者奖金发放。\n- 五月、六月和八月的薪水相对较高，表明这些月份员工的薪资水平较好。\n- 二月、三月和七月的薪水处于中等水平。\n- 十月和十一月的薪水与三月和六月相似，处于中等偏上水平。\n\n这些数据可以为公司在进行薪资结构调整和人力资源规划时提供参考。', 1824713159655571457, '2024-09-05 07:29:12', '2024-09-05 07:29:12', 0, '企业薪水情况');
INSERT INTO `chart` VALUES (1831474755824279554, '分析一年之间员工薪水状况', '折线图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工薪水状况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"line\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '根据数据分析，员工薪水在一年内波动较大。薪水的最高点出现在九月，达到6600元，而最低点出现在十二月，只有1000元。四月和八月的薪水也相对较高，分别为5000元和4300元。一月、二月、三月、七月和十一月的薪水在2000元左右，五月和六月的薪水分别为4200元和3000元。整体来看，薪水的分布不均，可能反映了员工的绩效、岗位、经验等因素的差异。\n\n进一步的建议可能是对薪水数据进行更深入的分析，例如按岗位、绩效等因素分组，以便更准确地了解薪水波动的原因，并据此制定更合理的薪酬政策。', 1824713159655571457, '2024-09-05 07:29:43', '2024-09-05 07:29:43', 0, '企业薪水情况');
INSERT INTO `chart` VALUES (1831477436932448257, '分析日活增长趋势', '柱状图', '日期,日活\n1,12\n2,15\n3,13\n4,20\n5,25\n', '{\n  \"title\": {\n    \"text\": \"日活增长趋势\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"1\", \"2\", \"3\", \"4\", \"5\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"日活\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 人\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"日活\",\n      \"type\": \"bar\",\n      \"data\": [12, 15, 13, 20, 25]\n    }\n  ]\n}', '根据数据分析，我们可以看到日活数在前四天呈现出波动上升的趋势，从12人增长到20人，第五天有一个较显著的跳跃，达到了25人。整体来看，日活数呈现正向增长趋势，特别是在第五天，可能是由于某些推广活动或者优化措施的效果显现。建议继续关注这种趋势，并分析第五天日活增长的具体原因，以便复制成功的策略。', 1824713159655571457, '2024-09-05 07:40:22', '2024-09-05 07:40:22', 0, '123456');
INSERT INTO `chart` VALUES (1831488141714808833, '分析一年内员工的工资情况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"bar\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '根据数据分析，一年内员工的工资情况呈现出较大的波动。其中，四月和九月的薪水最高，分别达到了5000元和6600元，而一月和十二月的薪水最低，分别为1100元和1000元。整体来看，员工的平均薪水大约在2800元左右。这可能表明公司在这段时间内对员工的薪酬结构进行了调整，或者不同月份的工作量和工作绩效有所差异。建议公司进一步分析工资波动的原因，并考虑是否需要调整薪酬政策以保持员工的积极性和稳定性。', 1824713159655571457, '2024-09-05 08:22:55', '2024-09-05 08:22:55', 0, '99999');
INSERT INTO `chart` VALUES (1831488878335254529, '分析一年内员工的工资情况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"bar\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '从柱状图分析一年内员工的工资情况来看，员工的薪水在不同月份有较大的波动。其中，四月和九月的薪水最高，分别达到了5000元和6600元，而一月和十二月的薪水最低，分别是1100元和1000元。整体来看，薪水的分布不均匀，可能反映了季节性工作强度或者员工绩效的差异。建议对高薪月份的员工绩效进行进一步分析，以及对低薪月份的员工进行激励措施以提高整体工作效率和员工满意度。', 1824713159655571457, '2024-09-05 08:25:50', '2024-09-05 08:25:50', 0, '969696');
INSERT INTO `chart` VALUES (1831489859508789250, '分析一年内员工的工资情况', '饼图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \'一年内员工工资情况\',\n    \"subtext\": \'\',\n    \"left\": \'center\'\n  },\n  \"tooltip\": {\n    \"trigger\": \'item\'\n  },\n  \"legend\": {\n    \"orient\": \'vertical\',\n    \"left\": \'left\'\n  },\n  \"series\": [\n    {\n      \"name\": \'工资\',\n      \"type\": \'pie\',\n      \"radius\": \'50%\',\n      \"data\": [\n        {\"value\": 1100, \"name\": \'aa\'},\n        {\"value\": 1500, \"name\": \'bb\'},\n        {\"value\": 2000, \"name\": \'cc\'},\n        {\"value\": 5000, \"name\": \'dd\'},\n        {\"value\": 4200, \"name\": \'ee\'},\n        {\"value\": 3000, \"name\": \'ff\'},\n        {\"value\": 1300, \"name\": \'gg\'},\n        {\"value\": 4300, \"name\": \"hh\"},\n        {\"value\": 6600, \"name\": \"ii\"},\n        {\"value\": 2000, \"name\": \"jj\"},\n        {\"value\": 3000, \"name\": \"kk\"},\n        {\"value\": 1000, \"name\": \"ll\"}\n      ],\n      \"emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \'rgba(0, 0, 0, 0.5)\'\n        }\n      }\n    }\n  ]\n}', '根据数据分析，我们可以看出员工ii的薪水最高，为6600，其次是员工dd，薪水为5000。员工ll的薪水最低，为1000。整体来看，员工的薪水分布较为分散，没有明显的集中在某一个区间内。这表明公司可能需要考虑调整薪酬结构，以更好地激励员工，同时保持薪酬的公平性。', 1824713159655571457, '2024-09-05 08:29:44', '2024-09-05 08:29:44', 0, '企业员工工资情况');
INSERT INTO `chart` VALUES (1831491210745765889, '分析日活增长情况', '饼图', '日期,日活\n1,12\n2,15\n3,13\n4,20\n5,25\n', '{\n  \"title\": {\n    \"text\": \"日活增长情况分析\",\n    \"subtext\": \"\",\n    \"left\": \"center\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": \"left\"\n  },\n  \"series\": [\n    {\n      \"name\": \"日活\",\n      \"type\": \"pie\",\n      \"radius\": \"50%\",\n      \"data\": [\n        {\"value\": 12, \"name\": \"1\"},\n        {\"value\": 15, \"name\": \"2\"},\n        {\"value\": 13, \"name\": \"3\"},\n        {\"value\": 20, \"name\": \"4\"},\n        {\"value\": 25, \"name\": \"5\"}\n      ],\n      \" emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \"rgba(0, 0, 0, 0.5)\"\n        }\n      }\n    }\n  ]\n}', '从数据分析来看，日活用户数量呈现增长趋势，特别是在第4天和第5天增长明显，分别达到了20和25。这表明在这段时间内，网站或应用的活跃用户数量在稳步增长。建议进一步分析这些日期背后的原因，比如是否有特定的活动或推广，以便今后能够复制这些成功的策略。同时，也可以对比其他日期的增长情况，探索是否有潜在的周期性趋势或者用户活跃的触发点。', 1824713159655571457, '2024-09-05 08:35:06', '2024-09-05 08:35:06', 0, '12345613');
INSERT INTO `chart` VALUES (1831491994560520193, '分析一年中的员工的工资情况', '折线图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年中员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"line\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '根据数据分析，员工工资在一年内波动较大。其中四月和九月的工资最高，分别为5000元和6600元，而一月和十二月的工资最低，分别为1100元和1000元。整体来看，工资分布不均，可能需要进一步分析工资与员工绩效、岗位、工作时间等因素的关系，以便于制定更合理的薪酬政策。', 1824713159655571457, '2024-09-05 08:38:13', '2024-09-05 08:38:13', 0, '企业员工工资情况');
INSERT INTO `chart` VALUES (1832034491774820353, '分析一年内员工工资情况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [{\n    \"name\": \"薪水\",\n    \"type\": \"bar\",\n    \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n  }]\n}', '根据数据分析，我们可以看到一年内员工的薪水情况如下：\n\n- 最高薪水出现在九月，为6600元。\n- 最低薪水出现在十二月，为1000元。\n- 薪水分布不均匀，四月、五月和八月的薪水相对较高，而一月、七月和十二月的薪水较低。\n- 从一月到九月，薪水的波动较大，而十月和十一月相对稳定。\n\n这些数据可能反映了员工的绩效、职位变化或者公司的薪酬政策调整。建议对薪水数据进行更深入的分析，以便了解背后的具体原因，并据此调整人力资源策略。', 1824713159655571457, '2024-09-06 20:33:55', '2024-09-06 20:33:55', 0, '工资');
INSERT INTO `chart` VALUES (1832044842100744194, '分析员工一年内工资的情况', '饼图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"员工一年内工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": \"left\",\n    \"data\": [\"aa\", \"bb\", \"cc\", \"dd\", \"ee\", \"ff\", \"gg\", \"hh\", \"ii\", \"jj\", \"kk\", \"ll\"]\n  },\n  \"series\": [\n    {\n      \"name\": \"员工薪水\",\n      \"type\": \"pie\",\n      \"radius\": \"50%\",\n      \"data\": [\n        {\"value\": 1100, \"name\": \"aa\"},\n        {\"value\": 1500, \"name\": \"bb\"},\n        {\"value\": 2000, \"name\": \"cc\"},\n        {\"value\": 5000, \"name\": \"dd\"},\n        {\"value\": 4200, \"name\": \"ee\"},\n        {\"value\": 3000, \"name\": \"ff\"},\n        {\"value\": 1300, \"name\": \"gg\"},\n        {\"value\": 4300, \"name\": \"hh\"},\n        {\"value\": 6600, \"name\": \"ii\"},\n        {\"value\": 2000, \"name\": \"jj\"},\n        {\"value\": 3000, \"name\": \"kk\"},\n        {\"value\": 1000, \"name\": \"ll\"}\n      ],\n      \"emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \"rgba(0, 0, 0, 0.5)\"\n        }\n      }\n    }\n  ]\n}', '根据数据分析，员工ii的薪水最高，为6600，其次是dd，薪水位5000。ll的薪水最低，为1000。整体来看，员工薪水分布不均，有较大的差距。建议公司进行薪酬体系的调整，以平衡员工之间的薪资差异，提高员工的满意度。同时，也可以考虑对表现优秀的员工进行奖励，激励员工的积极性。', 1824713159655571457, '2024-09-06 21:15:02', '2024-09-06 21:15:02', 0, '工资');
INSERT INTO `chart` VALUES (1832045610237190146, '分析员工一年内工资的情况', '饼图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \'员工一年内工资情况\',\n    \"subtext\": \'\',\n    \"left\": \'center\'\n  },\n  \"tooltip\": {\n    \"trigger\": \'item\'\n  },\n  \"legend\": {\n    \"orient\": \'vertical\',\n    \"left\": \'left\'\n  },\n  \"series\": [\n    {\n      \"name\": \'薪水\',\n      \"type\": \'pie\',\n      \"radius\": \'50%\',\n      \"data\": [\n        {\"value\": 1100, \"name\": \'一月 - aa\'},\n        {\"value\": 1500, \"name\": \'二月 - bb\'},\n        {\"value\": 2000, \"name\": \'三月 - cc\'},\n        {\"value\": 5000, \"name\": \'四月 - dd\'},\n        {\"value\": 4200, \"name\": \'五月 - ee\'},\n        {\"value\": 3000, \"name\": \'六月 - ff\'},\n        {\"value\": 1300, \"name\": \'七月 - gg\'},\n        {\"value\": 4300, \"name\": \'八月 - hh\'},\n        {\"value\": 6600, \"name\": \"九月 - ii\'},\n        {\"value\": 2000, \"name\": \'十月 - jj\'},\n        {\"value\": 3000, \"name\": \'十一月 - kk\'},\n        {\"value\": 1000, \"name\": \'十二月 - ll\'}\n      ],\n      \" emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \'rgba(0, 0, 0, 0.5)\'\n        }\n      }\n    }\n  ]\n}', '根据数据分析，员工一年的薪水情况如下：\n\n- 最高薪水为九月，员工ii的6600元。\n- 最低薪水为十二月，员工ll的1000元。\n- 薪水在2000元以下的有4个月份，分别是1月、2月、7月和12月。\n- 薪水在2000元到4000元之间的有5个月份，分别是3月、5月、6月、10月和11月。\n- 薪水在4000元以上的有3个月份，分别是4月、8月和9月。\n\n整体来看，员工的薪水在一年内波动较大，需要进一步分析是否存在季节性因素或者员工绩效的变化导致薪水波动。如果需要更详细的分析，可以考虑将员工的绩效、工作时间等因素纳入考量。', 1824713159655571457, '2024-09-06 21:18:05', '2024-09-06 21:18:05', 0, '132');
INSERT INTO `chart` VALUES (1832045853360021505, '分析员工一年内工资的情况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"员工一年内工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"bar\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '根据数据分析，员工一年的工资情况呈现出较大的波动。其中九月是薪水最高的月份，达到6600元，而十二月则是薪水最低的月份，只有1000元。从整体趋势来看，四月和八月的薪水较高，一月、七月和十二月的薪水较低。这可能反映了季节性因素或者员工绩效奖金的发放对工资的影响。建议进一步分析员工绩效与工资之间的关系，以及是否有必要调整薪酬结构以保持员工的积极性。', 1824713159655571457, '2024-09-06 21:19:03', '2024-09-06 21:19:03', 0, '465');
INSERT INTO `chart` VALUES (1832047597716529153, '分析该一年内员工的工资情况，并简要说明工资之间的差距', '散点图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"日期: {a}<br/>{b}: {c} (元)\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"scatter\",\n      \"data\": [\n        [\"一月\", 1100],\n        [\"二月\", 1500],\n        [\"三月\", 2000],\n        [\"四月\", 5000],\n        [\"五月\", 4200],\n        [\"六月\", 3000],\n        [\"七月\", 1300],\n        [\"八月\", 4300],\n        [\"九月\", 6600],\n        [\"十月\", 2000],\n        [\"十一月\", 3000],\n        [\"十二月\", 1000]\n      ],\n      \"symbolSize\": function (data) {\n        return Math.sqrt(data[1]) / 20;\n      },\n      \"label\": {\n        \"show\": true,\n        \"position\": \"top\",\n        \"formatter\": \"{c}\"\n      }\n    }\n  ]\n}', '一年内员工的工资情况存在较大差距。最高工资为6600元，最低工资为1000元。大部分员工的工资分布在1000至5000元之间，其中4000至5000元的工资区间较为集中。工资最高的员工与最低的员工之间的差距达到5600元，显示出公司内部工资分配的不均衡性。建议公司对工资结构进行合理调整，以提高员工的满意度和工作积极性。', 1824713159655571457, '2024-09-06 21:25:59', '2024-09-06 21:25:59', 0, '工资情况');
INSERT INTO `chart` VALUES (1832047942156967938, '分析该一年内员工的工资情况，并说明工资之间的差距，以及各种情况', '散点图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"{a} <br/>{b} : {c} ($)\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} $\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"员工薪水\",\n      \"type\": \"scatter\",\n      \"data\": [\n        [\"一月\", 1100],\n        [\"二月\", 1500],\n        [\"三月\", 2000],\n        [\"四月\", 5000],\n        [\"五月\", 4200],\n        [\"六月\", 3000],\n        [\"七月\", 1300],\n        [\"八月\", 4300],\n        [\"九月\", 6600],\n        [\"十月\", 2000],\n        [\"十一月\", 3000],\n        [\"十二月\", 1000]\n      ],\n      \"symbolSize\": function (data) {\n        return data[1] / 100;\n      },\n      \"label\": {\n        \"show\": true,\n        \"position\": \"top\",\n        \"formatter\": \"{c}\"\n      }\n    }\n  ]\n}', '根据数据分析，我们可以看到一年内员工的工资情况存在较大的差距。最高工资为6600美元，出现在九月，而最低工资为1000美元，出现在十二月。平均工资大约在3000美元左右。工资分布不均，有明显的两端分化现象，四月、五月、八月和九月的工资相对较高，而一月、二月、七月和十二月的工资相对较低。这可能反映出公司在不同时间段的业绩波动或者员工绩效的差异。建议公司对工资结构进行审视，确保内部公平性，并激励员工提高工作效率和绩效。', 1824713159655571457, '2024-09-06 21:27:21', '2024-09-06 21:27:21', 0, '123');
INSERT INTO `chart` VALUES (1832048221355008001, '分析该一年内员工的工资情况，并说明工资之间的差距，以及各种情况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况分析\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"薪水（元）\"\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"bar\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000],\n      \"itemStyle\": {\n        \"color\": new echarts.graphic.LinearGradient(0, 0, 0, 1, [{\n          \"offset\": 0,\n          \"color\": \"rgba(0, 255, 255, 1)\"\n        }, {\n          \"offset\": 1,\n          \"color\": \"rgba(0, 0, 255, 1)\"\n        }])\n      },\n      \"markLine\": {\n        \"data\": [\n          { \"type\": \"average\", \"name\": \"平均值\" }\n        ]\n      }\n    }\n  ]\n}', '根据数据分析，一年内员工的工资情况存在较大的差距。最高工资为6600元，最低工资为1000元，平均工资为大约3166.67元。从数据中可以看出，四月和九月的员工工资远高于其他月份，而一月的工资最低。这种工资差距可能是由于员工职位、工作绩效、加班等因素造成的。建议公司对工资分配进行合理调整，以减少员工之间的收入差距，提高员工的满意度和工作积极性。', 1824713159655571457, '2024-09-06 21:28:28', '2024-09-06 21:28:28', 0, '123');
INSERT INTO `chart` VALUES (1832048526985551874, '分析该一年内员工的工资情况，并说明工资之间的差距，以及各种情况', '柱状图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"xAxis\": {\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"],\n    \"axisLabel\": {\n      \"rotate\": 45\n    }\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"bar\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000]\n    }\n  ]\n}', '根据数据分析，一年内员工的工资情况存在较大差距。最高工资为6600元，出现在九月，而最低工资为1000元，出现在十二月。平均工资大约在3000元左右。工资分布不均，有四个月的工资在4000元以上，三个月在2000-3000元之间，四个月在1000-2000元之间。这种分布可能反映了员工职位、绩效、工作时间等因素的差异。建议公司对工资结构进行审查，以确保公平性和激励性。', 1824713159655571457, '2024-09-06 21:29:41', '2024-09-06 21:29:41', 0, '123');
INSERT INTO `chart` VALUES (1832048672523706370, '分析该一年内员工的工资情况，并说明工资之间的差距，以及各种情况', '折线图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况分析\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\"\n  },\n  \"legend\": {\n    \"data\": [\"薪水\"]\n  },\n  \"toolbox\": {\n    \"feature\": {\n      \"saveAsImage\": {}\n    }\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"薪水\",\n      \"type\": \"line\",\n      \"data\": [1100, 1500, 2000, 5000, 4200, 3000, 1300, 4300, 6600, 2000, 3000, 1000],\n      \"itemStyle\": {\n        \"normal\": {\n          \"color\": \"#ff7f0e\"\n        }\n      },\n      \"markPoint\": {\n        \"data\": [\n          { \"type\": \"max\", \"name\": \"最大值\" },\n          { \"type\": \"min\", \"name\": \"最小值\" }\n        ]\n      }\n    }\n  ]\n}', '根据数据分析，一年内员工的工资情况呈现出较大的波动。最高工资为6600元，出现在九月，而最低工资为1000元，出现在十二月。工资之间的差距较大，表明公司可能存在不同岗位或职级的工资差异。\n\n从折线图可以看出，四月和八月的工资相对较高，而一月、七月和十二月的工资相对较低。这可能反映了公司业务周期性对员工工资的影响，或者是员工绩效评价和奖金发放的时间差异。\n\n总体来说，员工的工资水平在一年内波动较大，建议公司对工资体系进行评估，确保内部公平性和外部竞争力，同时考虑对工资较低月份的员工给予一定的补贴或调整。', 1824713159655571457, '2024-09-06 21:30:16', '2024-09-06 21:30:16', 0, '66666');
INSERT INTO `chart` VALUES (1832049214306148353, '分析该一年内员工的工资情况，并说明工资之间的差距，以及各种情况', '散点图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"一年内员工工资情况分析\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\",\n    \"formatter\": \"{a} <br/>{b} : {c}元\"\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"一月\", \"二月\", \"三月\", \"四月\", \"五月\", \"六月\", \"七月\", \"八月\", \"九月\", \"十月\", \"十一月\", \"十二月\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"axisLabel\": {\n      \"formatter\": \"{value}元\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"员工薪水\",\n      \"type\": \"scatter\",\n      \"data\": [\n        {\"value\": [1100, \"aa\"]},\n        {\"value\": [1500, \"bb\"]},\n        {\"value\": [2000, \"cc\"]},\n        {\"value\": [5000, \"dd\"]},\n        {\"value\": [4200, \"ee\"]},\n        {\"value\": [3000, \"ff\"]},\n        {\"value\": [1300, \"gg\"]},\n        {\"value\": [4300, \"hh\"]},\n        {\"value\": [6600, \"ii\"]},\n        {\"value\": [2000, \"jj\"]},\n        {\"value\": [3000, \"kk\"]},\n        {\"value\": [1000, \"ll\"]}\n      ],\n      \"symbolSize\": function (data) {\n        return Math.sqrt(data[0]) / 20; // 根据薪水大小调整散点大小\n      },\n      \"label\": {\n        \"show\": true,\n        \"formatter\": \"{b}\",\n        \"position\": \"top\"\n      },\n      \"itemStyle\": {\n        \"color\": \"#ff7f0e\"\n      }\n    }\n  ]\n}', '根据数据分析，一年内员工的工资情况存在较大的差距。最高薪水为6600元，由员工ii在九月获得；最低薪水为1000元，由员工ll在十二月获得。平均工资大约在2800元左右。工资分布不均，有四个员工的薪水在4000元以上，而四个员工的薪水在2000元以下。这可能反映了公司内部的薪酬激励机制或者员工的工作表现差异。建议公司对薪酬结构进行审查，确保公平性和激励性，同时关注低收入员工的工作状态和提升机会。', 1824713159655571457, '2024-09-06 21:32:25', '2024-09-06 21:32:25', 0, '9696');
INSERT INTO `chart` VALUES (1833046793194049538, '分析日活趋势', '柱状图', '日期,日活\n1,12\n2,15\n3,13\n4,20\n5,25\n', '{\n  \"title\": {\n    \"text\": \"日活趋势分析\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"axis\",\n    \"axisPointer\": {\n      \"type\": \"shadow\"\n    }\n  },\n  \"legend\": {\n    \"data\": [\"日活\"]\n  },\n  \"xAxis\": {\n    \"type\": \"category\",\n    \"data\": [\"1\", \"2\", \"3\", \"4\", \"5\"]\n  },\n  \"yAxis\": {\n    \"type\": \"value\",\n    \"name\": \"人数\",\n    \"axisLabel\": {\n      \"formatter\": \"{value} 人\"\n    }\n  },\n  \"series\": [\n    {\n      \"name\": \"日活\",\n      \"type\": \"bar\",\n      \"data\": [12, 15, 13, 20, 25]\n    }\n  ]\n}', '数据分析结论：\n从提供的日活数据来看，日活用户数在前三天保持在较低但相对稳定的水平，第四天开始有较明显的增长，第五天达到最高值25人。这表明可能在前三天和第四天之间有某些事件或变化发生，导致了用户的活跃度提升。建议进一步分析这段时间内的用户行为和外部事件，以确定促进用户活跃的具体因素，并考虑如何将这些因素转化为长期的用户活跃策略。', 1824713159655571457, '2024-09-09 15:36:26', '2024-09-09 15:36:26', 0, '999');
INSERT INTO `chart` VALUES (1833424581642280962, '分析日活趋势', '饼图', '日期,日活\n1,12\n2,15\n3,13\n4,20\n5,25\n', '{\n  \"title\": {\n    \"text\": \'日活趋势分析\',\n    \"subtext\": \'\',\n    \"left\": \'center\'\n  },\n  \"tooltip\": {\n    \"trigger\": \'item\'\n  },\n  \"legend\": {\n    \"orient\": \'vertical\',\n    \"left\": \'left\'\n  },\n  \"series\": [\n    {\n      \"name\": \'日活\',\n      \"type\": \'pie\',\n      \"radius\": \'50%\',\n      \"data\": [\n        {\"value\": 12, \"name\": \'1号\'},\n        {\"value\": 15, \"name\": \'2号\'},\n        {\"value\": 13, \"name\": \'3号\'},\n        {\"value\": 20, \"name\": \'4号\'},\n        {\"value\": 25, \"name\": \'5号\'}\n      ],\n      \"label\": {\n        \"show\": true,\n        \"formatter\": \'{b}: {c}人\'\n      }\n    }\n  ]\n}', '从数据分析来看，日活数从1号到5号呈现波动上升趋势，其中5号的日活数最高，达到25人。2号和4号的日活数相比前后日期有较明显增长，而3号的日活数相对较低。这表明在这五天内，网站的用户活跃度有一定波动，建议进一步分析具体原因，比如营销活动、节假日等因素，以优化运营策略。', 1824713159655571457, '2024-09-10 16:37:38', '2024-09-10 16:37:38', 0, '日活趋势');
INSERT INTO `chart` VALUES (1836293976601153537, '分析今年员工的工资情况', '饼图', '日期,员工,薪水\n一月,aa,1100\n二月,bb,1500\n三月,cc,2000\n四月,dd,5000\n五月,ee,4200\n六月,ff,3000\n七月,gg,1300\n八月,hh,4300\n九月,ii,6600\n十月,jj,2000\n十一月,kk,3000\n十二月,ll,1000\n', '{\n  \"title\": {\n    \"text\": \"今年员工工资情况\",\n    \"subtext\": \"\"\n  },\n  \"tooltip\": {\n    \"trigger\": \"item\"\n  },\n  \"legend\": {\n    \"orient\": \"vertical\",\n    \"left\": \"left\"\n  },\n  \"series\": [\n    {\n      \"name\": \"工资\",\n      \"type\": \"pie\",\n      \"radius\": \"50%\",\n      \"data\": [\n        {\"value\": 1100, \"name\": \"aa\"},\n        {\"value\": 1500, \"name\": \"bb\"},\n        {\"value\": 2000, \"name\": \"cc\"},\n        {\"value\": 5000, \"name\": \"dd\"},\n        {\"value\": 4200, \"name\": \"ee\"},\n        {\"value\": 3000, \"name\": \"ff\"},\n        {\"value\": 1300, \"name\": \"gg\"},\n        {\"value\": 4300, \"name\": \"hh\"},\n        {\"value\": 6600, \"name\": \"ii\"},\n        {\"value\": 2000, \"name\": \"jj\"},\n        {\"value\": 3000, \"name\": \"kk\"},\n        {\"value\": 1000, \"name\": \"ll\"}\n      ],\n      \"emphasis\": {\n        \"itemStyle\": {\n          \"shadowBlur\": 10,\n          \"shadowOffsetX\": 0,\n          \"shadowColor\": \"rgba(0, 0, 0, 0.5)\"\n        }\n      }\n    }\n  ]\n}', '根据数据分析，员工工资分布情况如下：\n\n- 工资最高的是员工ii，达到了6600元。\n- 工资最低的是员工ll，只有1000元。\n- 大部分员工的工资集中在1000元到5000元之间，其中2000元和3000元的工资分别有两位员工。\n- 有三位员工的工资在5000元以上，显示出公司有一定比例的高薪员工。\n\n这些数据可以帮助公司管理层了解员工的薪酬结构，为进一步的薪酬调整和激励机制提供参考。', 1824713159655571457, '2024-09-18 14:39:35', '2024-09-18 14:39:35', 0, '2024');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` bigint NULL DEFAULT NULL,
  `message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1835621253155717122, '还不错，哈哈哈哈', '2024-09-16 18:06:25', 1824713159655571457);
INSERT INTO `message` VALUES (1835621292955467778, '哥们，加油哦', '2024-09-16 18:06:35', 1824713159655571457);
INSERT INTO `message` VALUES (1835621403466989569, '喽喽喽喽喽喽', '2024-09-16 18:07:01', 1824713159655571457);
INSERT INTO `message` VALUES (1835623978643820546, '134613', '2024-09-16 18:17:15', 1824713159655571457);
INSERT INTO `message` VALUES (1835625128428326913, '1234613', '2024-09-16 18:21:49', 1824713159655571457);
INSERT INTO `message` VALUES (1835626095328645122, '我认为平台还是挺不错的，还是功能还是需要改善', '2024-09-16 18:25:40', 1824713159655571457);
INSERT INTO `message` VALUES (1835626270109487105, '希望您继续加油，争取早日找到理想的工作！！！', '2024-09-16 18:26:21', 1824713159655571457);
INSERT INTO `message` VALUES (1835626554160336897, '谢谢大家的关心，本小牛会继续加油的！！！！', '2024-09-16 18:27:29', 1824713159655571457);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `questionContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '题目内容（json格式）',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for scoring_result
-- ----------------------------
DROP TABLE IF EXISTS `scoring_result`;
CREATE TABLE `scoring_result`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图片',
  `resultProp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果属性集合 JSON，如 [I,S,T,J]',
  `resultScoreRange` int NULL DEFAULT NULL COMMENT '结果得分范围，如 80，表示 80及以上的分数命中此结果',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '评分结果' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scoring_result
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `remark` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phone` bigint NULL DEFAULT NULL,
  `sex` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userAccount`(`userAccount`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1824676157900046338, 'admin', '502556ea1a4ae5c589d41cf8f3e1da0d', NULL, NULL, 'user', '2024-08-17 13:14:31', '2024-10-06 12:54:32', 0, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (1824713159655571457, 'user', '502556ea1a4ae5c589d41cf8f3e1da0d', '李硕', 'http://localhost:8101/image/4256c5b8-3463-43cd-811b-ebff9dbe1ce3.jpg', 'user', '2024-08-17 15:41:33', '2024-10-06 12:54:32', 0, '技术是越来越新颖，spring框架从原生态技术已经演变成现在生态相对来说最大的框架， 从框架层次：springboot,springcloud;随着数据量的增大，从业务技术相关集合Set,List,Queue研究，转为优化技术研究，reids,mongodb,Elasticsearch,MQ,定时任务等； 微服务生态也在逐渐扩大，Nacos,GateWay,Feign;', 15139471712, '男', 21);

-- ----------------------------
-- Table structure for user_answer
-- ----------------------------
DROP TABLE IF EXISTS `user_answer`;
CREATE TABLE `user_answer`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT 0 COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT 0 COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户答案（JSON 数组）',
  `resultId` bigint NULL DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '结果图标',
  `resultScore` int NULL DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_appId`(`appId`) USING BTREE,
  INDEX `idx_userId`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户答题记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_answer
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
