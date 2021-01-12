<template>
  <div class="user information">
    <h3 v-if="0">个人资料修改</h3>
    <div class="content" v-if="false">敬请期待。。。</div>
    <ul class="edit">
      <li>
        <label for="nickname">昵称</label>
        <input type="text" name="nickname" v-model="nickname" id="nickname">
        <em v-show="!nickname" v-text="nicknameTips"></em>
      </li>
      <li class="avator">
        <label for="avator">头像<span>上传头像</span></label>
        <input type="file" name="avator" ref="avator" id='avator' @change="dealUpload()" value="avator" v-show="false">
        <br />
        <img class="preview" :src="avator" alt=""/>
      </li>
      <li>
        <label for="mobilephone">手机号</label>
        <input type="text" name="mobilephone" v-model="mobilephone" id='mobilephone'>
        <em v-show="!mobilephone" v-text="mobilephoneTips"></em>
      </li>
    </ul>
    <div class="btn" @click='saveUserInfo'>保存</div>
    <div class="saveTips" v-text="saveTips"></div>
    <br />
    <br />
    <br />
  </div>
</template>

<script>
import axios from 'axios'
import { prefixPath } from '../originConfig'

export default {
  title () {
    return this.title
  },
  asyncData () {
  },
  data() {
    return {
      title: '资料修改',
      nickname: '',
      avator: '',
      mobilephone: '',
      nicknameTips: '',
      mobilephoneTips: '',
      saveTips: '',
    }
  },
  mounted() {
    let id = this.info.id;
    if (id) {
      this.editUserInfo(this.info);
    }
  },
  watch: {
    info(val) {
      let id = val.id;
      if (id) {
        this.editUserInfo(val);
      }
    }
  },
  computed: {
    info () {
      return this.$store.state.info;
    },
  },
  methods: {
    dealUpload(e) {
      let target = this.$refs.avator;
      let self = this;
      if (target.value) {
        var formData = new FormData();
        formData.append('files', target.files[0])
        axios({
            method: 'post',
            url: `${prefixPath}/postAvator`,
            data: formData
          }).then(function(response) {
            self.avator = `${prefixPath}/public/avator/${response.data.picAddr}`;
          })
          .catch(function(error) {
            console.log('error', error);
          });
      }
    },
    editUserInfo(info) {
      this.nickname = info.name;
      this.avator = info.avator;
      this.mobilephone = info.mobilephone;
      this.nicknameTips = '昵称不能为空';
      this.mobilephoneTips = '手机号不能为空';
    },
    saveUserInfo() {
      let nickname = this.nickname;
      let avator = this.avator;
      let mobilephone = this.mobilephone;
      let userid = this.info.id;
      let flag = userid && nickname && avator && mobilephone;
      let self = this;
      if (flag) {
        axios.post(`${prefixPath}/editInfo`, {
            nickname: nickname,
            userid: userid,
            avator: avator,
            mobilephone: mobilephone,
          })
          .then(function(response) {
            let status = response.data.status;
            if (status === 'ok') {
              self.saveTips = '修改成功'
            }
          })
          .catch(function(error) {
            alert('服务器开小差了')
            console.log('error', error);
          });
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
.information {
  min-height:500px;
}
.information h3,.information .content{ text-align:left; }
.content{margin-top:20px; text-align:center;}
.information {width:880px; margin: 30px auto 0;font-size:18px;}
.information li{position:relative;margin-bottom:20px;}
.information li em{font-style:normal; font-size:15px; margin-left:13px; color:red; display:inline-block; transform: translateY(6px);}
.information label{position:absolute;left:0;height:34px;line-height:34px;}
.information input{margin-left:70px;outline:none;height:28px;line-height:28px;padding:2px 5px;font-size:18px;}
.information .btn{margin:60px 0 0 70px;padding:2px;width:50px;text-align:center;height:28px;line-height:28px;border:1px solid;border-radius:3px;cursor:pointer;user-select:none;}
.information .saveTips{margin:8px 0 0 68px;font-size: 16px;color: red;}
.information .btn:active{color:#fff;border-color:#fff;background:#000;}
.information .avator label{display:block;}
.information .avator span{margin-left:33px;}
.information .avator .preview{display:block;margin:10px 0 0 70px;height:66px;}
</style>
