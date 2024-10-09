<template>
  <div id="chart_List_container">
    <div style="height: 100%;width: 100%;display: flex;justify-content: space-between;flex-wrap: wrap">
      <div style="width: 30%;height: 45%" v-for="(chart, index) in chartsList" :key="index">
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
</template>

<script setup>
import { onMounted, ref } from 'vue';
import * as echarts from 'echarts';
import instance from "../api/request.js";

const name = ref('');

const chartsList = ref([
  {
    title: '示例图表1',
    options: {
      tooltip: {
        trigger: 'axis'
      },
      xAxis: {
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {},
      series: [
        {
          name: 'Data',
          type: 'bar',
          data: [120, 200, 150, 80, 70, 110, 130]
        }
      ]
    }
  },
  {
    title: '示例图表2',
    options: {
      tooltip: {
        trigger: 'axis'
      },
      xAxis: {
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {},
      series: [
        {
          name: 'Data',
          type: 'line',
          data: [100, 150, 120, 180, 160, 130, 110]
        }
      ]
    }
  },
  {
    title: '示例图表3',
    options: {
      tooltip: {
        trigger: 'axis'
      },
      xAxis: {
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {},
      series: [
        {
          name: 'Data',
          type: 'pie',
          radius: '55%',
          data: [
            { value: 1048, name: 'Mon' },
            { value: 735, name: 'Tue' },
            { value: 580, name: 'Wed' },
            { value: 484, name: 'Thu' },
            { value: 300, name: 'Fri' },
            { value: 300, name: 'Sat' },
            { value: 300, name: 'Sun' }
          ]
        }
      ]
    }
  },
  {
    title: '示例图表1',
    options: {
      tooltip: {
        trigger: 'axis'
      },
      xAxis: {
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {},
      series: [
        {
          name: 'Data',
          type: 'bar',
          data: [120, 200, 150, 80, 70, 110, 130]
        }
      ]
    }
  },
  {
    title: '示例图表2',
    options: {
      tooltip: {
        trigger: 'axis'
      },
      xAxis: {
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {},
      series: [
        {
          name: 'Data',
          type: 'line',
          data: [100, 150, 120, 180, 160, 130, 110]
        }
      ]
    }
  },
  {
    title: '示例图表3',
    options: {
      tooltip: {
        trigger: 'axis'
      },
      xAxis: {
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      },
      yAxis: {},
      series: [
        {
          name: 'Data',
          type: 'pie',
          radius: '55%',
          data: [
            { value: 1048, name: 'Mon' },
            { value: 735, name: 'Tue' },
            { value: 580, name: 'Wed' },
            { value: 484, name: 'Thu' },
            { value: 300, name: 'Fri' },
            { value: 300, name: 'Sat' },
            { value: 300, name: 'Sun' }
          ]
        }
      ]
    }
  }
]);

const chartContainers = ref([]);

onMounted(() => {
  instance.get('/chart/chartList',name).then(res => {

  })
  initCharts();
});

const initCharts = () => {
  charts.value.forEach((chart, index) => {
    const chartInstance = echarts.init(chartContainers.value[index]);
    chartInstance.setOption(chart.options);

    // 自动调整图表大小
    window.addEventListener('resize', () => {
      chartInstance.resize();
    });
  });
};

</script>

<style>
#chart_List_container {
  color: #2c3e50;
  height: 100%;
  width: 100%;
}

.chart-container {
  width: 25rem;
  height: 15.5rem;
  margin: auto;
}
</style>