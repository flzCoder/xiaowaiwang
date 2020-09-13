<template>
  <div class="register main">
    <ul>
      <li class="username">
        <label for="username">用户名</label>
        <input type="text" name="username" v-model="username" id="username" @blur="checkusername" @focus="focususername" />
        <i>*</i>
        <em v-text="usernameTips"></em>
      </li>
      <li class="password">
        <label for="password">密码</label>
        <input type="password" name="password" v-model="password" value="" id="password" @blur="checkpassword" @focus="focuspassword" />
        <i>*</i>
        <em v-text="passwordTips"></em>
      </li>
      <li class="confirm">
        <label for="confirm">确认密码</label>
        <input type="password" name="confirm" v-model="confirm" value="" id="confirm" @blur="checkconfirm" @focus="focusconfirm" />
        <i>*</i>
        <em v-text="confirmTips"></em>
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
      confirm: '',
      usernameTips: '',
      passwordTips: '',
      confirmTips: '',
      nameVerfy: false,
      passVerfy: false,
      repassVerfy: false
    }
  },
  asyncData () {
  },
  computed: {
  },
  methods: {
    register() {
      let self = this;
      if (this.nameVerfy && this.passVerfy && this.repassVerfy) {
        let data = {
          username: this.username,
          password: this.password
        }
        axios.post(`${prefixPath}/register`,data)
        .then(res=>{
          if (res.data.status === 'ok') {
            this.$store.commit('setInfo', {
              id: 'name',
              item: this.username
            })
            this.$store.commit('setLoged', {
              mine: true,
              btn: false
            })
            this.$router.replace({
              path:'/message',
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
    },
    checkusername (e) {
      if (this.username) {
        axios.get(`${prefixPath}/check?username=${this.username}`)
        .then((res) =>{
          let data = res.data;
          if (data.code === 2) {
            this.nameVerfy = true;
          } else {
            this.nameVerfy = false;
          }
          this.usernameTips = res.data.res;
        })
        .catch((err) => {
          this.nameVerfy = false;
        })
      } else {
        this.usernameTips = '用户名不能为空';
        this.nameVerfy = false;
      }
    },
    checkpassword (e) {
      if (this.password) {
        this.passVerfy = true;
      } else {
        this.passwordTips = '密码不能为空';
        this.passVerfy = false;
      }
    },
    checkconfirm (e) {
      if (this.confirm) {
        if (this.confirm === this.password) {
          this.repassVerfy = true;
        } else {
          this.confirmTips = '两次密码不一致';
          this.repassVerfy = false;
        }
      } else {
        this.confirmTips = '确认密码不能为空';
        this.repassVerfy = false;
      }
    },
    focususername () {
      this.usernameTips = '';
    },
    focuspassword () {
      this.passwordTips = '';
    },
    focusconfirm () {
      this.confirmTips = '';
    }
  }
}
</script>

<style lang="stylus" scoped>
  .register {
    padding:20px 0 0 35px;
    min-height:500px;
  }
  .register li {
    position:relative;
    padding-left:85px;
    margin-bottom:10px;
  }
  i {
    font-style:normal;
    position:absolute;
    left:279px;
    color:red;
    line-height:30px;
  }
  em {
    font-style:normal;
    font-size:13px;
    position:absolute;
    left:297px;
    top:-1px;
    color:red;
    line-height:30px;
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
