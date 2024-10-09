<template>
  <div id="home_container">
    <el-menu
        router
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        :ellipsis="false"
    >
      <el-menu-item index="/home/index">
        <div style="width: 200px;height: 100%;display: flex">
          <div style="width: 30%;height: 100%;display: flex">
            <van-icon size="40" style="margin: auto"
                      name="data:image/png;base64,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">
            </van-icon>
          </div>
          <div style="width: 60%;height: 100%;display: flex">
            <div
                style="width: 100%;height: 100%;margin: auto;display: flex;align-items: end;font-weight: bolder;font-size: 45px;">
              <span style="font-size: 20px;">AI&nbsp;</span> <span style="font-size: 20px;">智慧云</span>
            </div>
          </div>
        </div>
      </el-menu-item>
      <el-menu-item style="" index="/home/index">
        <template #title>
          <span style="font-size: 15px;">主页</span>
        </template>
      </el-menu-item>
        <el-menu-item style="" index="/home/data">
        <template #title>
          <span style="font-size: 15px;">智能分析</span>
        </template>
      </el-menu-item>
      <el-menu-item style="" index="/home/question">
        <template #title>
          <span style="font-size: 15px;">性格测试</span>
        </template>
      </el-menu-item>
      <el-menu-item style="" index="/home/send">
        <template #title>
          <span style="font-size: 15px;">AI 小云</span>
        </template>
      </el-menu-item>
      <el-sub-menu  style="font-size: 15px" index="2">
        <template #title>我的功能</template>
        <el-menu-item index="/home/chart">
          <template #title>
            <el-icon><PieChart /></el-icon>
            <span style="font-size: 15px;letter-spacing: 3px;">我的图表</span>
          </template>
        </el-menu-item>
        <el-menu-item index="/home/me">
          <template #title>
            <el-icon><User /></el-icon>
            <span style="font-size: 15px;letter-spacing: 3px;">个人信息</span>
          </template>
        </el-menu-item>
        <el-menu-item index="/home/message">
          <template #title>
            <el-icon><ChatDotRound /></el-icon>
            <span style="font-size: 15px;letter-spacing: 3px;">联系作者</span>
          </template>
        </el-menu-item>
        <el-menu-item index="/home/setting">
          <template #title>
            <el-icon><Setting /></el-icon>
            <span style="font-size: 15px;letter-spacing: 3px;">系统设置</span>
          </template>
        </el-menu-item>
        <el-menu-item @click="goLogout">
          <template #title>
            <el-icon><Fold /></el-icon>
            <span  style="font-size: 15px;letter-spacing: 3px;">退出登录</span>
          </template>
        </el-menu-item>

      </el-sub-menu>
    </el-menu>
    <div style="flex: 1">
      <router-view/>
    </div>
  </div>
</template>

<script setup>
import {HomeFilled,Menu as IconMenu,Histogram,Setting,User,Fold,PieChart,ChatDotRound} from "@element-plus/icons-vue";
import {useRouter} from "vue-router";
import {ref} from "vue";


const router = useRouter();


const activeIndex = ref('1')

const goLogout = () => {
  router.push('/login')
}
</script>

<style lang="scss">
.el-menu--horizontal > .el-menu-item:nth-child(1) {
  margin-right: auto;
}
#home_container{
     width: 100%;
    height: 100vh;
  .el-menu-demo{

  }
  }
</style>