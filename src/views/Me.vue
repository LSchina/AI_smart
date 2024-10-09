<template>
<div id="me_container">
  <!-- 个人信息卡片 -->
  <el-card id="shopping_image">
    <div style="box-sizing: border-box;padding: 2.75rem;margin-left: 50px;z-index: 1000;width: 90%;height: 85%;background-color: rgb(245,245,245);border-radius: 8px">
      <div style="width: 100%;height: 60%;display: flex">
        <el-image style="background-color: #2c3e50;width: 20%;height: 30vh" :src="userInfo.userAvater"/>
        <div style="width: 30%;height: 30vh;margin-left: 20px;letter-spacing: 2px">
          <div style="display: flex;flex-wrap: wrap;margin-bottom: 35px;margin-top: 10px">
            <div>姓名：</div>
            <div style="margin-left: 20px"><div style="margin-top: 0px">{{userInfo.userName}}</div></div>
          </div>
          <div style="display: flex;flex-wrap: wrap;margin-bottom: 35px;margin-top: 10px">
            <div>性别：</div>
            <div style="margin-left: 20px"><div style="margin-top: 0px">{{userInfo.sex}}</div></div>
          </div>
          <div style="display: flex;flex-wrap: wrap;margin-bottom: 35px;margin-top: 12px">
            <div>年龄：</div>
            <div style="margin-left: 20px"><div style="margin-top: 4px">{{userInfo.age}}</div></div>
          </div>
          <div style="display: flex;flex-wrap: wrap;margin-bottom: 35px;margin-top: 10px">
            <div>手机：</div>
            <div style="margin-left: 20px"><div style="margin-top: 4px">{{userInfo.phone}}</div></div>
          </div>
        </div>
      </div>
      <div style="width: 100%;height: 40%;margin-top: 20px;letter-spacing: 2px;line-height: 26px">
        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{userInfo.remark}}</div>
      </div>
    </div>
  </el-card>

  <!-- 修改信息按钮 -->
  <div style="width: 19%;height: 100%;box-sizing: border-box;">
    <el-upload
        v-model:file-list="fileList"
        class="upload-demo"
        action=""
        :on-preview="handlePreview"
        :http-request="uploadFile"
    >
      <el-button style="width: 270px" type="primary">上传头像</el-button>
    </el-upload>
    <el-input  v-model="userInfo.userName"  style="width: 100%;;height: 40px;margin-top: 43px"/>
    <el-input  v-model="userInfo.sex" style="width: 100%;;height: 40px;margin-top: 43px"/>
    <el-input  v-model="userInfo.age" style="width: 100%;;height: 40px;margin-top: 43px"/>
    <el-input  v-model="userInfo.phone" style="width: 100%;;height: 40px;margin-top: 43px"/>
    <el-input  v-model="userInfo.remark" style="width: 100%;;height: 40px;margin-top: 43px"/>
    <el-button @click="updateMy" style="width: 100%;height: 40px;margin-top: 43px"  type="primary">保存修改</el-button>
  </div>
</div>
</template>

<script setup>

import {onMounted, reactive} from "vue";
import instance from "../api/request.js";
import {ElMessage} from "element-plus";

const userInfo = reactive({
  userName:'无',
  sex:'男',
  age:'22',
  phone:'XXXXX',
  remark:'技术是越来越新颖，spring框架从原生态技术已经演变成现在生态相对来说最大的框架， 从框架层次：springboot,springcloud;随着数据量的增大，从业务技术相关集合Set,List,Queue研究，转为优化技术研究，reids,mongodb,Elasticsearch,MQ,定时任务等； 微服务生态也在逐渐扩大，Nacos,GateWay,Feign;',
  userAvater:'http://localhost:8101/image/8e925587-f2e7-4cdb-8d07-75b65c2c1294.jpg',
  file:''
})

const fileList = reactive([

])

const uploadFile = (v) => {
  console.log(v)
  userInfo.file = v.file
}

const handlePreview = () => {
  if (fileList.length >= 2){
    ElMessage({
      message: '最多上传一张图片',
      type: 'warning'
    })
  }

}


const updateMy = () => {
  let dataForm = new FormData()
  dataForm.append('file',userInfo.file)
  dataForm.append('userName',userInfo.userName)
  dataForm.append('userAvatar',userInfo.userAvater)
  dataForm.append('age',userInfo.age)
  dataForm.append('sex',userInfo.sex)
  dataForm.append('phone',userInfo.phone)
  dataForm.append('remark',userInfo.remark)
  let config = {
    headers: {
      "Content-Type": "multipart/form-data",
    }
  }
  instance.post('/user/update/my',dataForm,config).then( res => {
    if (res.data.code == 0){
      ElMessage({
        message: '修改成功',
        type: 'success'
      })
      userInfo.userAvater = res.data.data.userAvatar
      userInfo.userName = res.data.data.userName
      userInfo.sex = res.data.data.sex
      userInfo.age = res.data.data.age
      userInfo.phone = res.data.data.phone
      userInfo.remark = res.data.data.remark
      fileList.value = ''
    }
  })
}


onMounted( () => {
  instance.get('/user/get/login').then( res => {
    if (res.data.code == 0){
      console.log(res.data)
      if (res.data.data.userAvatar != null){
        userInfo.userAvater = res.data.data.userAvatar
      }
      if (res.data.data.userName != null){
        userInfo.userName = res.data.data.userName
      }
      if (res.data.data.sex != null){
        userInfo.sex = res.data.data.sex
      }
      if (res.data.data.userName != null){
        userInfo.age = res.data.data.age
      }
      if (res.data.data.phone != null){
        userInfo.phone = res.data.data.phone
      }
      if (res.data.data.remark != null) {
        userInfo.remark = res.data.data.remark
      }
    }
    console.log(userInfo)
  })
})

</script>

<style scoped lang="scss">
#me_container{
  width: 100%;
  height: 90vh;
  display: flex;
  justify-content: space-between;
  box-sizing: border-box;
  align-items: center;
  padding: 2.75rem;
}
#shopping_image{
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 8px;
  width: 79%;
  height: 100%;
}

/*面包屑图片*/
.grid_image{
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 8px;
  opacity: 0.6;
  /*加深图片*/
  -webkit-filter: brightness(50%);
  filter: brightness(50%);
  z-index: -1;
}
</style>