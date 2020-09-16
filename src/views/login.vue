<template>
  <div class="login main">
    <ul>
      <li class="username">
        <label for="username">用户名</label>
        <input type="text" name="username" v-model="username" id="username"/>
      </li>
      <li class="password">
        <label for="password">密码</label>
        <input type="text" name="password" v-model="password" value="" id="password"/>
      </li>
    </ul>
    <div class="loginbtn" @click="login">登录</div>
    <div class="tips">
      <span class="left">忘记密码</span>
      <span class="right" @click="register">去注册</span>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { prefixPath } from '../originConfig'
import { EventBus } from '../store/eventBus'

export default {
  title () {
    return this.title
  },
  data() {
    return {
      title: '登录',
      username: '',
      password: ''
    }
  },
  asyncData () {
  },
  methods: {
    register() {
      this.$router.push('/register')
    },
    login() {
      axios.post(`${prefixPath}/login`,{
        username: this.username,
        password: this.password
      })
      .then(res=>{
        if (res.data.status === 1) {
          this.$store.commit('setInfo', {
            id: 'name',
            item: res.data.name
          })
          this.$store.commit('setInfo', {
            id: 'avator',
            item: res.data.avator
          })
          this.$store.commit('setInfo', {
            id: 'id',
            item: res.data.id
          })
          this.$store.commit('setLoged', {
            mine: true,
            btn: false
          })
          this.$router.replace({
            path:'/message',
            query:{
              username:res.data.name
            }
          })
        } else {
          alert(`${res.data.msg}`)
        }
      })
      .catch(err=>{
        //alert('服务器开小差了')
        console.log('err',err);
      })
    }
  }
}
</script>

<style lang="stylus" scoped>
  .login {
    padding:20px 0 0 35px;
    min-height:500px;
  }
  li {
    position:relative;
    padding-left:66px;
    margin-bottom:10px;
  }
  .username label, .password label {
    position:absolute;
    left:0;
    line-height: 26px;
  }
  input {
    line-height: 26px;
    outline:none;
    padding: 0 10px;
  }
  .loginbtn {
    margin-top:30px;
    cursor:pointer;
    width: 193px;
    height: 30px;
    background: red;
    text-align: center;
    line-height: 30px;
    color: #fff;
    border-radius: 7px;
    margin-left: 69px;
  }
  .loginbtn:active {color:#f2f2f2;}
  .tips{margin-top:10px;margin-left:69px;overflow:hidden;width:193px;}
  .tips span{font-size:12px;cursor:pointer;}
  .tips .left{float:left;}
  .tips .right{float:right;}
</style>
