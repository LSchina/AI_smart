<template>
  <div id="chart_home_container">
    <div style="width: 100%;height: 50px;">
          <el-input style="width: 30%;--el-input-bg-color: #fafafa" placeholder="请输入图表名称" v-model="form.name" />
          <el-button style="margin-left: 10px" type="primary" @click="onSubmit">提交</el-button>
          <el-button @click="reset" >重置</el-button>
    </div>
    <div style="display: flex;width: 100%;height: 100%;overflow: hidden">
      <div style="width: 100%;height: 100%;">
        <div style="width: 100%;height: 10%;">
          <div style="width: 100%;height: 100%;display: flex;justify-content: space-between;">
            <div style="width: 70%;height: 100%;"></div>
            <div style="width: 30%;height: 100%;display: flex;justify-content: right">
              <el-pagination
                  background
                  :total="25"
                  v-model:current-page="form.pageNo"
                  v-model:page-size="form.pageSize"
                  @current-change="onSubmit"
                  style="width: 70%;display: flex;justify-content: space-between;"
                  layout="prev, pager, next"
              />
            </div>
          </div>
        </div>
        <!--      //chart图表数据 start-->
        <div id="chart_List_container">
          <div style="height: 100%;width: 100%;display: flex;justify-content: space-between;flex-wrap: wrap">

            <div  v-loading="loading[index]"
                  element-loading-text="AI服务有点慢哦，加载中..."
                  :element-loading-spinner="svg"
                  element-loading-custom-class="svg-loading"
                  element-loading-svg-view-box="-10, -10, 50, 50"
                  style="width: 33%;height: 45%;margin-top: 20px" v-for="(chart, index) in chartsList" :key="index">

              <el-card>
                <template #header>

                  {{ chart.title }}
                </template>
                <div ref="chartContainers" class="chart-container">
                  <v-chart :option="chart.options" autoresize></v-chart>
                </div>
              </el-card>
            </div>
          </div>
        </div>
        <!--      //chart图表数据 end-->
      </div>
    </div>
  </div>
</template>

<script setup>

/**
 * chart图表
 */
import {onMounted, reactive, ref} from 'vue';
import * as echarts from 'echarts';
import instance from "../api/request.js";

// 导入 v-chart 组件
import VChart from 'vue-echarts';

const loading = ref([])

const form = reactive({
  name:'',
  pageNo: 1,
  pageSize: 6,
})

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

const total = ref(0)

const onSubmit = () => {
  chartsList.value = []
  loading.value = []
  instance.post('/chart/chartList', form).then(res => {
    if (res.data.code == 0) {
      dataChartList.value = res.data.data.list
      total.value = parseInt(res.data.total)
      dataChartList.value.forEach((item, index) => {
        try {
          chartsList.value.push({
            title: item.name,
            options: safeParse(item.genChart),
            id: item.id
          })
          loading.value[index] = false
        }catch (e){
          chartsList.value.push({
            title: item.name,
            options: '',
            id: item.id
          })
          loading.value[index] = true
        }
      })
    }}
  )}

const reset = () => {
  location.reload()
}


const chartsList = ref([]);

const dataChartList = reactive([])

const chartContainers = ref([]);

function safeParse(jsonString) {
  try {
    return JSON.parse(jsonString.replace(/'/g, '"'));
  } catch (e) {
    throw e;
    return ''
  }
}

onMounted(() => {
  instance.post('/chart/chartList',form).then(res => {
    if (res.data.code == 0){
      dataChartList.value = res.data.data.list
      total.value = parseInt(res.data.data.total)

      dataChartList.value.forEach((item,index) => {
        try {
          chartsList.value.push({
            title: item.name,
            options: safeParse(item.genChart),
            id: item.id
          })
          loading.value[index] = false
        }catch (e) {
          chartsList.value.push({
            title: item.name,
            options: '',
            id: item.id
          })
          console.error(e)
          loading.value[index] = true
        }
      })
    }
  })
});

onMounted(() =>{
  initCharts();
})

const initCharts = () => {
  chartsList.value.forEach((chart, index) => {
    const chartInstance = echarts.init(chartContainers.value[index]);
    chartInstance.setOption(chart.options);

    // 自动调整图表大小
    window.addEventListener('resize', () => {
      chartInstance.resize();
    });
  });
};






// onMounted(() => {
//   console.log(string.replace(/'/g, '"'))
//   option.value = JSON.parse(string.replace(/'/g, '"'))
//   console.log(option.value)
// })

</script>

<style scoped lang="scss">
#chart_home_container{
  width: 100%;
  box-sizing: border-box;
  padding: 2.75rem 2.75rem 2.75rem 2.75rem;
}

#chart_List_container {
  color: #2c3e50;
  height: 100%;
  width: 100%;
}

.chart-container {
  width: 30rem;
  height: 25rem;
  margin: auto;
}
</style>
