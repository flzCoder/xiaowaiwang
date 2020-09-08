<template>
  <div class="register main">
    <ul>
      <li class="username">
        <label for="username">用户名</label>
        <input type="text" name="username" v-model="username" id="username"/>
      </li>
      <li class="password">
        <label for="password">密码</label>
        <input type="text" name="password" v-model="password" value="" id="password"/>
      </li>
      <li class="confirm">
        <label for="confirm">确认密码</label>
        <input type="text" name="confirm" v-model="confirm" value="" id="confirm"/>
      </li>
    </ul>
    <div class="registerbtn" @click="register">注册</div>
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
      title: '注册',
      username: '',
      password: '',
      confirm: ''
    }
  },
  asyncData () {
  },
  computed: {
  },
  methods: {
    register() {
      let self = this;
      let data = {
        username: this.username,
        password: this.password
      }
      axios.post(`${prefixPath}/register`,data)
      .then(res=>{
        if (res.data.status === 'ok') {
          localStorage.setItem("username", this.username);
          EventBus.$emit('login', this.username)
          this.$router.replace({
            path:'/user',
            query:{
              username:this.username
            }
          })
        }
      })
      .catch(err=>{
        alert('服务器开小差了')
        console.log('err',err);
      })
    }
  }
}
</script>

<style lang="stylus">
  .register {
    padding:20px 0 0 35px;
    min-height:500px;
  }
  .register li {
    position:relative;
    padding-left:85px;
    margin-bottom:10px;
  }
  label {
    position:absolute;
    left:0;
    line-height: 26px;
  }
  input {
    line-height: 26px;
    outline:none;
    padding: 0 10px;
  }
  .registerbtn {
    margin-top:30px;
    cursor:pointer;
    width: 193px;
    height: 30px;
    background: red;
    text-align: center;
    line-height: 30px;
    color: #fff;
    border-radius: 7px;
    margin-left: 85px;
  }
  .registerbtn:active {color:#f2f2f2;}
</style>
