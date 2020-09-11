<template>
  <div id="app">
    <h3 class="website">校外网</h3>
    <ul class='nav' v-show="showNav">
      <router-link :to="'./info'" v-show="isloged"><li class="enroll"><span v-text="nickname"></span><span class="logout" @click.prevent='logout'>退出</span></li></router-link>
      <router-link :to="'./index'" v-show="false"><li>首页</li></router-link>
      <router-link :to="'./message'" v-show="true"><li>发帖</li></router-link>
      <router-link :to="'./recommend'" v-show="false"><li>资讯</li></router-link>
      <router-link :to="'./user'" v-show="isloged"><li>个人主页</li></router-link>
      <router-link :to="'./login'" v-show="!isloged"><li class="enroll">登录</li></router-link>
      <router-link :to="'./register'" v-if="false"><li>注册</li></router-link>
    </ul>
    <router-view class="view"></router-view>
    <div class="footer">
      <a href="http://beian.miit.gov.cn/" target="_blank">浙ICP备2020032336号</a>
    </div>
  </div>
</template>

<script>
import { EventBus } from './store/eventBus'

export default {
  data() {
    return {
      nickname: '',
      isloged:false,
      showNav:false
    }
  },
  created() {
  },
  mounted() {
    EventBus.$on("login", (name) => {
      this.nickname = '欢迎您: '+name;
      this.isloged = true;
    });
    let username = localStorage.getItem("username");
    if (username) {
      this.nickname = '欢迎您: '+username;
      this.isloged = true;
      this.showNav = true;
    } else {
      this.showNav = true;
      //this.$router.push('/login')
    }
  },
  methods: {
    logout() {
      localStorage.removeItem("username");
      this.isloged = false;
    }
  }
}

</script>

<style lang="stylus">
  *{margin:0;padding:0;}
  .website{padding: 10px 0 18px 0;}
  #app {
    color: red;
    width:980px;
    margin:0 auto;
  }
  .logout {
    margin-left:10px;
  }
  h3
   text-align:center

  .router-link-active li{
    color: red;
  }
  .view {
    color: #000;
  }
  ul {list-style:none;}
  .nav {overflow:hidden;margin-bottom:50px;position:relative;}
  .nav .enroll{position:absolute; right:0;}
  .nav li {float:left; padding:3px;margin-right:28px;}
  .footer {text-align:center;}
  .footer a{text-decoration: none;}
</style>
