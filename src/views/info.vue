<template>
  <div class="user information">
    <h3 v-if="0">个人资料修改</h3>
    <div class="content" v-if="false">敬请期待。。。</div>
    <ul class="edit">
      <li>
        <label for="nickname">昵称</label>
        <input type="text" name="nickname" v-model="nickname" id="nickname">
      </li>
      <li class="avator">
        <label for="avator">头像<span>上传头像</span></label>
        <input type="file" name="avator" id='avator' value="avator" v-show="false">
        <br />
        <img class="preview" :src="avator" alt=""/>
      </li>
      <li>
        <label for="mobilephone">手机号</label>
        <input type="text" name="mobilephone" v-model="mobilephone" id='mobilephone'>
      </li>
    </ul>
    <div class="btn">保存</div>
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
      mobilephone: ''
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
    editUserInfo(info) {
      console.log('kkk',info);
      this.nickname = info.name;
      this.avator = info.avator;
      this.mobilephone = info.mobilephone;
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
.information label{position:absolute;left:0;height:34px;line-height:34px;}
.information input{margin-left:70px;outline:none;height:28px;line-height:28px;padding:2px 5px;font-size:18px;}
.information .btn{margin:60px 0 0 70px;padding:2px;width:50px;text-align:center;height:28px;line-height:28px;border:1px solid;border-radius:3px;cursor:pointer;user-select:none;}
.information .btn:active{color:#fff;border-color:#fff;background:#000;}
.information .avator label{display:block;}
.information .avator span{margin-left:33px;}
.information .avator .preview{display:block;margin:10px 0 0 70px;height:66px;}
</style>
