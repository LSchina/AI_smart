<template>
  <div class="home-container">
    <div style="width: 100%;height: 90vh;display: flex">
      <div style="width: 50%;height: 100%">
        <div style="width: 100%;height: 100%;box-sizing: border-box;padding: 7rem 10rem 4rem 10rem;">
          <div style="width: 100%;height: 5%;display: flex">
            <van-icon size="25"
                      name="data:image/png;base64,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">
            </van-icon>&nbsp;&nbsp;
            <div style="height: 100%;display: flex;align-items: center">
              AI 智慧云平台
            </div>
          </div>
          <div style="letter-spacing: 2px;font-size: 28px;line-height: 40px;text-align: center;margin-top: 60px">
            使用AI智慧云，为您的工作于娱乐保驾护航。</div>
          <div style="margin-top: 40px;letter-spacing: 2px;text-align: center;line-height: 25px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这里您可以体验主流的AI的技术，进行数据大模型可视化分析，同时可以进行AI问题答疑，体验不一样的场景。
          </div>
          <div>
            <div style="margin-top: 80px;display: flex;justify-content: center;align-items: center">
              <el-button @click="goData" style="letter-spacing: 2px" type="primary">数据分析</el-button>
              <el-button @click="goQuestion" style="letter-spacing: 2px" type="primary">问题答疑</el-button>
            </div>
        </div>
        </div>
      </div>
      <div style="width: 50%;height: 100%;display: flex;justify-content: left;align-items: center">
        <el-image style="width: 75%;height: 75%" :src="'../src/assets/img.png'"></el-image>
      </div>

    </div>

    <div class="home_create">
      <div style="text-align: center; font-size: 40px;position: relative; "><p>关于作者</p></div>
    </div>
    <div style="width: 100%;height: 80vh;box-sizing: border-box;padding: 0 5.75rem 5.75rem 5.75rem;display: flex;justify-content: center;align-items: center;">
<!--      <div style="width: 100%;height: 100%;display: flex">
        <div style="width: 50%;height: 100%;display: flex;flex-wrap: wrap">
          <div style="width: 50%;height: 50%;display: flex;justify-content: center;align-items: center;">
            <div ref="chartContainer" class="chart">
              <v-chart :option="option3" autoresize></v-chart>
            </div>
          </div>
          <div style="width: 50%;height: 50%;display: flex;justify-content: center;align-items: center;">
            <div ref="chartContainer" class="chart">
              <v-chart :option="option1" autoresize></v-chart>
            </div>
          </div>
          <div style="width: 50%;height: 50%;display: flex;justify-content: center;align-items: center;">
            <div ref="chartContainer" class="chart">
              <v-chart :option="option2" autoresize></v-chart>
            </div>
          </div>
          <div style="width: 50%;height: 50%;display: flex;justify-content: center;align-items: center;">
            <div ref="chartContainer" class="chart">
              <v-chart :option="option3" autoresize></v-chart>
            </div>
          </div>
        </div>
        <div style="width: 50%;height: 100%"></div>
      </div>-->
      <div style=";width: 50%;height: 100%;display: flex;justify-content: center;align-items: center">
      <el-carousel
          height="350px"
          :interval="4000"
          style="width: 90%;border-radius: 10px"
          :autoplay="false"
      >
        <el-carousel-item v-for="(item,index) in imageList" :key="index">
          <el-image style="width: 100%;height: 100%;border-radius: 10px" :fit="'fill'" :src="imageList[index]"></el-image>
        </el-carousel-item>
      </el-carousel>
      </div>
      <div  style="width: 50%;height: 100%;margin-top: 70px">
        <div style="width: 100%;height: 20%;display: flex;align-items: center;justify-content: left">
          <div>AI 智慧云 作者的见解：</div>
        </div>
        <div style="width: 100%;height: 80%;box-sizing: border-box;padding-top: 0px;;letter-spacing: 1px;line-height: 35px;text-align: left;font-size: medium">
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术是越来越新颖，spring框架从原生态技术已经演变成现在生态相对来说最大的框架，
          从框架层次：springboot,springcloud;</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着数据量的增大，从业务技术相关集合Set,List,Queue研究，转为优化技术研究，reids,mongodb,Elasticsearch,MQ,定时任务等；
        微服务生态也在逐渐扩大，Nacos,GateWay,Feign;</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          现在又整合了SpringSecurity，SpringAI;
          Python,Docker也得会;</div>
          <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加油吧，锅锅们，主要现在小硕就会这么多，学其他的我会再加的</div>
        </div>
      </div>
    </div>



    <div style="width: 100%;bottom: 0;font-size: small;height: 10vh;padding-top: 20px;box-sizing: border-box;letter-spacing: 1px;color: #8d8d8d;">
      <div style="width: 100%;text-align: center">AI 智慧云平台</div>
      <div style="width: 100%;text-align: center;margin-top: 5px">© 2024. Powered by Lishuo.</div>
    </div>

  </div>
</template>

<script setup>
import {useRouter} from "vue-router";
import {onMounted, reactive, ref} from 'vue';
const router = useRouter();

const goData = () => {
  router.push('/home/data')
}
const goQuestion = () => {
  router.push('/home/question')
}

const imageList = reactive([
  '../src/assets/ai1.png',
  '../src/assets/1.png',
  '../src/assets/2.png',
])


/*// 导入并注册组件
const chartOptions = ref({
  toolbox: {
    show: false,
    feature: {
      mark: { show: false },
      dataView: { show: false, readOnly: false },
      restore: { show: false },
      saveAsImage: { show: false }
    }
  },
  series: [
    {
      name: 'Nightingale Chart',
      type: 'pie',
      radius: [10, 130],
      center: ['50%', '50%'],
      roseType: 'area',
      itemStyle: {
        borderRadius: 8
      },
      data: [
        { value: 40, },
        { value: 38, },
        { value: 32, },
        { value: 30, },
        { value: 28,  },
        { value: 26,  },
        { value: 22, },
        { value: 18,  }
      ]
    }
  ]
});


const chartContainer = ref(null)

const option1 = ref({
    xAxis: {
  type: 'category',
      data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
},
yAxis: {
  type: 'value'
},
series: [
  {
    data: [120, 200, 150, 80, 70, 110, 130],
    type: 'bar'
  }
]
});

const option2 = ref({
  xAxis: {},
  yAxis: {},
  series: [
    {
      symbolSize: 20,
      data: [
        [10.0, 8.04],
        [8.07, 6.95],
        [13.0, 7.58],
        [9.05, 8.81],
        [11.0, 8.33],
        [14.0, 7.66],
        [13.4, 6.81],
        [10.0, 6.33],
        [14.0, 8.96],
        [12.5, 6.82],
        [9.15, 7.2],
        [11.5, 7.2],
        [3.03, 4.23],
        [12.2, 7.83],
        [2.02, 4.47],
        [1.05, 3.33],
        [4.05, 4.96],
        [6.03, 7.24],
        [12.0, 6.26],
        [12.0, 8.84],
        [7.08, 5.82],
        [5.02, 5.68]
      ],
      type: 'scatter'
    }
  ]
});

const option3 = ref( {
  xAxis: {
    type: 'category',
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      data: [150, 230, 224, 218, 135, 147, 260],
      type: 'line'
    }
  ]
})

const initCharts = () => {
    const chartInstance = echarts.init(chartContainer.value);
    chartInstance.setOption(chartOptions.value);
    // 自动调整图表大小
    window.addEventListener('resize', () => {
      chartInstance.resize();
    });
};

onMounted(()=>{
  initCharts();
})*/

</script>

<style lang="scss" scoped>
.home-container {
  width: 100%;

  .chart {
    width: 20rem;
    height: 18rem;
  }

  .home_create {
    width: 100%;
    height: 20vh;
    background-color: #fcfbfb;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}

</style>
