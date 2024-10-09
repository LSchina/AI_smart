<template>
<div id="message_container">
  <el-card style="width: 80%;height: 90%">
    <div style="display: flex;justify-content: space-between">
      <van-barrage
          :duration="6000"
          style="width: 35%;height: 100%;--van-barrage-font-size: 18px;--van-barrage-color: #507ece;--van-barrage-space: 20px"
          v-model="list"
          :rows="13">
        <div style="width: 100%; height: 75vh;background-color: #edeeef;display: flex;border-radius: 10px">
          <div style="width: 30%;height: 100%;display: flex;margin-left: 30px">
            <van-icon size="90" style="margin: auto"
                      name="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAAAAXNSR0IArs4c6QAAChJJREFUeF7tnUFyGjsQhqVncgSoys4+Adwg9hlMqrKLOYntk5jsUhV8hpAbwAniXargCMHR82Bw+fkFmJFao0b62MQVj3rUf+vTL82YGWv4oAAK7FTAog0KoMBuBQCE0YECexQAEIYHCgAIYwAF/BTAQfx0o1UhCgBIIYUmTT8FAMRPN1oVogCAFFJo0vRTAED8dKNVIQoASCGFJk0/BQDETzdaFaIAgBRSaNL0UwBA/HSjVSEKAEghhSZNPwUAxE83WhWiAIAUUmjS9FMAQPx0o1UhCgBIIYUmTT8FAMRPN1oVogCAFFJo0vRTAED8dKNVIQoASCGFJk0/BQDETzdaFaIAgBRSaNL0UwBA/HSjVSEKAEghhSZNPwUAxE83WhWiAIAUUmjS9FMAQPx0a9Rq8HFx5f6YD+tG1p4a504bBXhu97BtY435YYyZms7qYfb1/cv/N45Jg4MKAMhBifwOGAyX586Y66eBfO4XoXarqTXmdjbpTmu34MDaCgBIbanqH9i/XNw9zfhX9VuEH1lBYjqrMY4SruXrCAAiq6fpD5ffW3CNv/faubF993gLJHJFBRA5Lc1guLzZLKsEozYLtVlu3TRrxdG7FAAQobEx+PTr1K06P4XCBYWxndUZLhIk4UtjAJHRUYV7vKTi3Hh+3xsJpVZ0GAARKL8m99img4sIFLa6ui4Tpuwom0u61eZczefpXskFl37DywEg4RrqWl5t8rHWjWbfemOB9IoOASAC5U9x3+Ngt9mHHJSozgEAUkelA8cAiICISkMAiEBhkt4c3N3/6XzSvRBIr+gQACJQfgAREFFpCAARKAyACIioNASACBQGQAREVBoCQAQKAyACIioNASAChQEQARGVhgAQgcIAiICISkMAiEBhAERARKUhAESgMAAiIKLSEAAiUBgAERBRaQgAESgMgAiIqDQEgAgUBkAERFQaAkAECgMgAiIqDQEgAoUBEAERlYYAEIHCAIiAiEpDAIhAYQBEQESlIQBEoDAAIiCi0hAAIlAYABEQUWkIABEoDIAIiKg0BIAIFAZABERUGgJABAoDIAIiKg0BIAKFARABEZWGABCBwgCIgIhKQwCIQGEAREBEpSEARKAwACIgotIQACJQGAAREFFpCAARKAyACIioNASACBQGQAREVBoCQAQKAyACIioNoRaQ6q1NIZq1+Y4+AAmplO62agAZfFxcuT/mw/oVytYGwfFK8mn1s7Xuizl5nMaCBkB0D/KQ3iUFZP1uv98n18baq5Ak6rat3roUAxQAqVuB4zsuGSAJ3+s3tZ3VSNJNAOT4Bn7dHicBJCEcz7o492DfPV5IQQIgdYfb8R3XOiBaXplsjbmdTbo3EiUDEAkVdcZoH5Dh8sYZc61BDql3iQOIhmrG6UPrgPSHSxcnleZRpVwEQJprfywtWgUk+d7jL1WZT7rBGgDIsQz35v0MHhxNTjlQtLza9ltimQUgTUbBcR3bKiAaB1J1b2T2rTcOKZvGvJ5uuPIa6JCibtoCCIAIDKN8Q7QLyOXip+CfkYhURWKjjoOIlEJlkOIBMc6N5/e9UUh1ACREPd1tAQRAdI/QxL0DEABJPAR1nx5AAET3CE3cOwABkMRDUPfpAQRAdI/QxL0DEABJPAR1nx5AAET3CE3cOwABkMRDUPfpAQRAdI/QxL0DEABJPAR1nx5AAET3CE3cOwABELEhGPKwP6kHaIglswkEIADiNaYiPeiv6svUGvPDdFZjDdAACIA0AmT9rVDnPrf0tQXxZ5g1SrZ6KmfTBiHH9xV+H4Q/d69X0c3jmu7Wj4Zt81M9w8za0WzSXT9Gtu0PgOAgtcZc6u+8SDw7oFaibw4CEAA5OG76l4u7tp6fvLMzwk/DPJg0m/SNAgCyd6xoeRJm1UmJr0fXBWN7HA4CIPsBUfaopraXWgACIHsB0fQkzI2LXLS5YQcQANkJiKbl1aslj9hDx+sstwAEQHYDUr31y9nq0q6mT6sPxAMQANkNiLL9x6ajANLqdAUgxwWIcw/z+95ZW2MEBwGQnWNNxf2Pt70DkLbmBu6DHFIaQPhbrOp9hTx6dAcpAAIgALLHRgAEQAAEQPauNNmks8Rik74HEQABEAABkD0KAAiAAAiAHLqk+7ffs0lnk84mnU06m/S9CrDEYonFEoslFkssHwVYYrHEYonFEosllt/sySYdB8FBcBAcBAfBQfwUwEFwEBwEB8FB/OZP9iA4CA6Cg+AgOAgO4qcADoKD4CA4CA7iN3+yB8FBcBAcBAfBQXAQPwVwEBwEB8FBcBC/+ZM9CA6Cg+AgOAgOgoP4KYCD4CA4CA6Cg/jNn+xBcBAcBAfBQXAQHMRPARwEB8FBcBAcxG/+ZA+Cg+AgOAgOgoPgIH4K4CA4CA6Cg+AgfvMnexAcBAfBQXAQHAQH8VMAB8FBcBAcBAfxmz/Zg+AgOAgOgoPgIDiInwI4CA6Cg+AgOIjf/MkeBAfBQXAQHAQHwUH8FMBBcBAcBAfBQfzmT/YgOIixxtzOJt0bvyH03Ko/XH43xpyHxIjQdjqfdC9C4gIIgMgAcrm4M9ZehQxG8bbOjef3vVFI3MFweeOMuQ6JId7WuYf5fe9MPO6OgLatE2mdaUUcJFdAPi6unLN3bY6RGucKdsYa53g5pF1AFA4ka91o9q03biLa22M1zrQS4A80AiLgjE1q3SogGgWfT7rBGgyGy3NnTLUPUfOxxlzMJt1paIf6w6ULjSHZXgL8Jv0JHhxNTqZuIAmuZ/uXi5/G2tMmesQ8VgL89bJYWV5S4NfVvlVAtAkuORtpuuIjmZeq5aPghKYWEE2CS82yldia3NF2Vmezr+8f6g6CQ8dpcRFJ8A/lvP196w6i5WqWxOZc42Y9xiBSMqm1evUqKSCDT79O3e+T78nW7BGvhCSebaMNoqSQJFhaJQVke/IUd6BjzLBvnSTFfqSNvNaQOPe55YktGvR1lllJllivO7ZZu1d3a+P+qYZzY/vu8VZybb5P4FbzsvaLxCXdOgNmnVcFSVWvuFftphvogy9V18lr1zHJAdl2rBJ+83N1T+HD+mfnml82tfZ5c+rc+l/7j/lhTh6nbYHxv33Jp1+nZtWp8sgqr+2Fif/kFVIzJfV6Wz81gIRQTlsUiKUAgMRSlrhZKAAgWZSRJGIpACCxlCVuFgoASBZlJIlYCgBILGWJm4UCAJJFGUkilgIAEktZ4mahAIBkUUaSiKUAgMRSlrhZKAAgWZSRJGIpACCxlCVuFgoASBZlJIlYCgBILGWJm4UCAJJFGUkilgIAEktZ4mahAIBkUUaSiKUAgMRSlrhZKAAgWZSRJGIpACCxlCVuFgoASBZlJIlYCgBILGWJm4UCAJJFGUkilgIAEktZ4mahAIBkUUaSiKUAgMRSlrhZKAAgWZSRJGIpACCxlCVuFgoASBZlJIlYCvwLqHXgMkhCvRkAAAAASUVORK5CYII=">
            </van-icon>
          </div>
          <div style="width: 70%;height: 100%;display: flex">
            <div style="width: 100%;;margin: auto;display: flex;align-items: end;font-weight: bolder;font-size: 45px;">
              <span style="font-size: 45px;">AI </span>&nbsp;<span style="font-size: 45px;">智慧云</span>
            </div>
          </div>
        </div>
      </van-barrage>
      <div style="width: 60%;height: 100%;">
        <div style="width: 100%;height: 20vh;display: flex;box-sizing: border-box;padding-left: 50px;padding-right: 50px;justify-content: center;align-items: center;">
          <div style="letter-spacing: 1px;line-height: 25px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AI 智慧云平台致力于为您提供最便捷的工作与娱乐AI服务，欢迎您提出友好的意见，我们会以提高用户体验为宗旨，不断优化AI 智慧云平台。</div>
        </div>
        <div style="width: 100%;height: 70%;display: flex;justify-content: center;align-items: center">
          <div>
            <el-form-item style="margin-top: 80px" label="您的意见" label-position="top" label-width="120px">
              <el-input style="width: 500px;height: 50px" v-model="form.message"/>
            </el-form-item>
            <el-form-item style="margin-top: 30px">
              <van-space style="margin-top: 10px;margin-left: 180px">
                <van-button style="width: 150px;height: 50px" @click="add" type="primary" size="small">
                  <div style="font-size: 15px">提交</div>
                </van-button>
              </van-space>
            </el-form-item>
          </div>
        </div>
      </div>
    </div>
  </el-card>
</div>
</template>

<script setup>


import {onMounted, reactive, ref} from "vue";
import instance from "../api/request.js";
import {ElMessage} from "element-plus";



const form = reactive({
  message:''
})

const list = ref([])

const add = () => {
  list.value.push({ id: Math.random(), text: form.message });
  console.log(form)
  console.log(form.message)
  instance.post('/message/add',form).then( res => {
    if (res.data.code == 0 ){
      ElMessage({
        message: '提交成功',
        type: 'success'
      })
    }
  })
  form.message = ''
};

onMounted(() => {
  instance.get('/message/list').then( res => {
    if ( res.data.code == 0 ){
      res.data.data.forEach( item => {
        list.value.push({
          id: item.id,
          text: item.message
        })
      })
    }
  })
})


</script>

<style scoped>
#message_container{
  width: 100%;
  height: 90vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>