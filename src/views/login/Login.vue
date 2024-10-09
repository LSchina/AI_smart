<template>
  <div id="login_container">
    <div
        v-loading.fullscreen.lock="fullscreenLoading"
        class="custom-loading-svg"
        :element-loading-svg="svg"
        element-loading-text="登录中 . . ."
        element-loading-background="rgba(255, 255, 255,0.9)"
        style="margin: auto;width: 33%;height: 100%;">
      <div style="width: 100%;height: 25%;box-sizing: border-box;padding: 20px">
        <!--    标题    -->
        <div style="width: 100%;height: 80%;display: flex">
          <div style="width: 30%;height: 100%;display: flex">
            <van-icon size="90" style="margin: auto"
                      name="data:image/png;base64,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">
            </van-icon>
          </div>
          <div style="width: 70%;height: 100%;display: flex">
            <div style="width: 100%;height: 60%;margin: auto;display: flex;align-items: end;font-weight: bolder;font-size: 45px;">
              <span style="font-size: 45px;">AI </span>&nbsp;<span style="font-size: 45px;">智慧云</span>
            </div>
          </div>
        </div>
        <!--    小题    -->
        <div style="color: #999999;font-size: 13px;letter-spacing: 0.082rem">该平台利用了先进的AI技术进行数据分析，当前暂时为您提供免费服务</div>
      </div>
      <!--    登录    -->
      <div style="letter-spacing: 1px;display: flex;width: 100%;height: 6%;justify-content: center;align-items: start">
        <div style="height: 100%;border-bottom: 4px solid dodgerblue;">账号密码登录</div>
      </div>
      <!--    表单    -->
      <div style="width: 100%;height: 40%;box-sizing: border-box;padding: 30px;margin-top: 1%;">
        <el-form :model="form" style="max-width: 600px;">
          <el-form-item label="">
            <el-input size="large" style="--el-input-border-radius: 10px" :prefix-icon="User" placeholder="请输入用户名" v-model="form.userAccount"/>
          </el-form-item>
          <el-form-item label="">
            <el-input size="large" style="--el-input-border-radius: 10px" :prefix-icon="Lock" type="password" show-password placeholder="请输入密码"
                      v-model="form.userPassword"/>
          </el-form-item>
          <el-form-item>
            <el-checkbox value="Online activities" name="type">
              记住密码
            </el-checkbox>
          </el-form-item>
          <el-form-item>
            <el-button size="large" type="primary" @click="onLogin"
                       style="letter-spacing: 1px;width: 100%;height: 100%">登录
            </el-button>
          </el-form-item>
        </el-form>
      </div>
      <!--    其他的登陆方式    -->
      <div style="width: 100%;height: 10%;padding-left: 30px;letter-spacing: 1px;display: flex;flex-wrap: wrap">
        <div>其他登录方式：</div>
        <div @mouseover="tranIcon" @mouseleave="leaveIcon"  style="display: flex;width: 12%;justify-content: space-between;cursor: pointer">
          <van-icon  v-show="!trancolor" size="25" name="data:image/png;base64,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" color="#00A1E9"/>
        </div>
      </div>
      <!--    个人备案信息    -->
      <div style="width: 100%;bottom: 0;margin-top: 50px;font-size: small;height: 15%;padding: 30px;box-sizing: border-box;letter-spacing: 1px;color: #999999;">
        <div style="width: 100%;text-align: center">AI 智慧云平台</div>
        <div style="width: 100%;text-align: center;margin-top: 5px">© 2024. Powered by Lishuo.</div>
      </div>
    </div>
  </div>
</template>

<script setup>
import {reactive, ref} from "vue";
import { User,Lock } from '@element-plus/icons-vue'
import instance from "../../api/request";
import {ElMessage} from "element-plus";
import {useRouter} from "vue-router";
import useDataStore from "../../store/index.js";

const router = useRouter()

const dataStore = useDataStore()

const form = reactive({
  userAccount: '',
  userPassword: '',
})

const fullscreenLoading = ref(false)

const trancolor = ref(false)

const tranIcon = () => {
  trancolor.value = true
}

const leaveIcon = () => {
  trancolor.value = false
}


// 定义一个异步暂停函数
const sleep = async (ms) => {
  return new Promise(resolve => setTimeout(resolve, ms));
};

const onLogin = async () => {
  fullscreenLoading.value = true
  await sleep(500)
  let config = {
    headers: {
      "Content-Type": "application/json",
    }
  }
  instance.post('/user/login', form, config).then(res => {
    console.log(res)
    console.log(form)
    if (res.data.code == 0) {
      fullscreenLoading.value = false
      ElMessage({
        message: '登录成功',
        type: 'success',
        plain: true
      })
      dataStore.userId = res.data.data.id
      dataStore.userName = res.data.data.userName
      dataStore.userAvater = res.data.data.userAvater
      dataStore.authorization = res.data.data.authorization
      console.log(dataStore)
      router.push('/home')
    } else {
      fullscreenLoading.value = false
      ElMessage({
        message: '登录失败',
        type: 'error',
        plain: true,
      })
    }
  })
}

const svg = `<svg t="1726038676039" className="icon" viewBox="0 0 3072 3072" version="1.1"
                 xmlns="http://www.w3.org/2000/svg" p-id="23255" width="150px" height="150px">
  <path
      d="M882.22888 490.254067c0 120.884344-193.603645 49.032232-275.605064 125.376858-22.615128 31.68848-32.511505 292.820344-142.572063 292.820343-230.960962 0-418.189172-187.232225-418.189172-418.185157 0-230.960962 187.22821-418.189172 418.189172-418.189172 230.952932-0.00803 418.177128 187.216166 418.177127 418.177128z"
      fill="#B8D9FF" p-id="23256"></path>
  <path
      d="M104.502127 491.241697c0-214.917992 197.594313-391.800172 378.390882-414.210547a365.820677 365.820677 0 0 0-41.833772-2.444988c-214.311763 0-388.034329 186.549716-388.034329 416.655535S226.747474 907.897232 441.051208 907.897232c14.135961 0 28.087243-0.855143 41.833772-2.432943-180.788539-22.41439-378.382853-199.296571-378.382853-414.222592z"
      fill="#FFFFFF" opacity=".21" p-id="23257"></path>
  <path
      d="M438.545999 85.815439S356.127045 178.660718 356.127045 491.550833c-0.594184 122.076727 13.15636 333.33326 82.418954 407.706641 0 0-216.531924-52.472879-216.531924-407.698611 0-383.14837 216.531924-405.743424 216.531924-405.743424z"
      fill="#FFFFFF" opacity=".21" p-id="23258"></path>
  <path
      d="M456.672629 920.636057c-238.629149 0-432.770771-194.137607-432.770771-432.766756 0-238.629149 194.137607-432.766756 432.770771-432.766756 115.821735 0 224.469099 44.230582 305.936556 124.545803 81.796667 80.636402 126.842244 188.589213 126.842244 303.961295h-32.118059c0-106.712251-41.649093-206.535178-117.271063-281.093237-75.417217-74.353306-176.06317-115.299817-283.389678-115.299817-220.920054 0-400.652712 179.732658-400.652712 400.648697s179.732658 400.648697 400.652712 400.648697v32.122074z"
      fill="#6E6E96" p-id="23259"></path>
  <path
      d="M456.672629 920.636057c-108.069239 0-174.967141-229.463457-174.967141-442.064934 0-110.771171 16.918188-215.154862 47.639111-293.916373 32.583771-83.543086 77.801983-129.552206 127.32803-129.552205 49.522032 0 94.740244 46.009119 127.324015 129.552205 30.724938 78.765525 47.643126 183.149216 47.643126 293.920388 0 212.593447-66.893887 442.060919-174.967141 442.060919z m0-833.419468c-68.985576 0-142.849082 157.254031-142.849082 391.354534 0 106.55969 16.605036 212.934701 45.559466 291.848772 27.537221 75.051874 62.995558 118.098103 97.285601 118.098103 67.431865 0 142.849082-175.316425 142.849082-409.946875 0.004015-234.100502-73.859491-391.354534-142.845067-391.354534z"
      fill="#6E6E96" p-id="23260"></path>
  <path
      d="M456.672629 641.594361c-113.019435 0-219.502844-15.745878-299.83814-44.334966-85.534406-30.435876-132.643569-73.024422-132.643568-119.916788 0-46.888351 47.105148-89.476898 132.643568-119.916788 80.335295-28.589087 186.822719-44.334966 299.83814-44.334966s219.502844 15.745878 299.842154 44.334966c85.534406 30.43989 132.639554 73.024422 132.639554 119.916788s-47.105148 89.480912-132.639554 119.916788c-80.335295 28.589087-186.822719 44.334966-299.842154 44.334966z m0-296.385449c-109.442286 0-212.103647 15.083443-289.07056 42.476133-69.688158 24.799156-111.293089 58.314351-111.29309 89.657562s41.604931 64.858405 111.29309 89.661576c76.966914 27.388675 179.628274 42.472118 289.07056 42.472119 109.446301 0 212.103647-15.083443 289.07056-42.472119 69.684144-24.803171 111.293089-58.318366 111.293089-89.661576s-41.604931-64.858405-111.293089-89.657562c-76.966914-27.39269-179.628274-42.476133-289.07056-42.476133z"
      fill="#6E6E96" p-id="23261"></path>
  <path
      d="M863.684716 876.594168m-123.309258 0a123.309258 123.309258 0 1 0 246.618516 0 123.309258 123.309258 0 1 0-246.618516 0Z"
      fill="#94E3B2" p-id="23262"></path>
  <path
      d="M863.684716 1015.962456c-76.850486 0-139.368287-62.517802-139.368287-139.368288s62.517802-139.368287 139.368287-139.368287 139.372302 62.517802 139.372302 139.368287-62.525831 139.368287-139.372302 139.368288z m0-246.618516c-59.137376 0-107.250228 48.108838-107.250228 107.250228s48.108838 107.250228 107.250228 107.250229 107.254243-48.108838 107.254243-107.250229-48.116867-107.250228-107.254243-107.250228z"
      fill="#6E6E96" p-id="23263"></path>
  <path
      d="M460.028966 76.083667c-15.509008 0-30.809248 0.871202-45.880647 2.513238a384.71011 384.71011 0 0 1 19.780709-0.509874c208.783442 0 378.037583 169.246112 378.037584 378.033569 0 109.28571-175.019333 44.322921-249.147813 113.3366-20.451174 28.645294-29.392039 264.709012-128.889771 264.709013-208.791472 0-378.041598-169.254141-378.041598-378.041599 0-55.158752 11.82346-107.55535 33.057512-154.809044-30.078562 57.732211-47.105148 123.349405-47.105148 192.957269 0 230.952932 187.22821 418.185157 418.189172 418.185157 110.068588 0 119.952921-261.131864 142.576078-292.820344 7.756511-25.345163 275.601049-4.488499 275.601049-125.376857 0.00803-230.952932-187.216166-418.177128-418.177127-418.177128z"
      fill="#6E6E96" opacity=".15" p-id="23264"></path>
</svg>`

</script>

<style scoped lang="scss">
#login_container {
  width: 100%;
  height: 100vh;
  display: flex;
  overflow: hidden;
  background-image: url('https://mdn.alipayobjects.com/yuyan_qk0oxh/afts/img/V-_oS6r-i7wAAAAAAAAAAAAAFl94AQBr');
  -webkit-background-size: 100% 100%;
  background-size: 100% 100%;
  background-color: white;
  box-sizing: border-box;
  padding: 30px;

  .custom-loading-svg{
  }

}

</style>
