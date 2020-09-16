<template>
  <div id="app">
    <h3 class="website">校外网</h3>
    <ul class='nav'>
      <router-link :to="'./message'" v-show="true"><li>新鲜事</li></router-link>
      <router-link :to="'./user'" v-show="isloged.mine"><li><span>个人主页</span></li></router-link>
      <router-link :to="'./index'" v-show="false"><li>首页</li></router-link>
      <router-link :to="'./social'" v-show="isloged.mine"><li>好友</li></router-link>
      <router-link :to="'./recommend'" v-show="false"><li>资讯</li></router-link>
      <router-link :to="'./info'" class="infoNav" v-show="!isloged.btn"><li><span>欢迎您:{{info.name}}</span></li></router-link>
      <router-link :to="'./login'"><li class="enroll"><span v-show="isloged.btn">登录</span><span v-show="!isloged.btn" class="logout" @click.prevent='logout'>退出</span></li></router-link>
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
import { prefixPath } from './originConfig'
import axios from 'axios'

export default {
  data() {
    return {}
  },
  computed: {
    info () {
      return this.$store.state.info;
    },
    isloged () {
      return this.$store.state.isloged;
    }
  },
  created() {
  },
  beforeMount() {

  },
  mounted() {
    axios.get(`${prefixPath}/getInfo`)
    .then((res) =>{
      let data = res.data;
      if (data.code === 200) {
        this.$store.commit('setInfo', {
          id: 'name',
          item: data.res[0].name
        })
        this.$store.commit('setInfo', {
          id: 'id',
          item: data.res[0].id
        })
        this.$store.commit('setLoged', {
          mine: true,
          btn: false
        })
      } else {
        this.$store.commit('setLoged', {
          mine: false,
          btn: true
        })
      }
    })
    .catch((err) => {
      this.$store.commit('setLoged', {
        mine: false,
        btn: true
      })
    })
  },
  methods: {
    logout() {
      axios.get(`${prefixPath}/logout`)
      .then((res) =>{
        let data = res.data;
        if (data.code === 200) {
          this.$store.commit('setLoged', {
            mine: false,
            btn: true
          })
          this.$store.commit('setInfo', {
            id: 'name',
            item: ''
          })
          this.$store.commit('setInfo', {
            id: 'id',
            item: ''
          })
          this.$router.replace('./message')
        }
      })
      .catch((err) => {})
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
    color: #000;
  }
  h3
   text-align:center

  .router-link-active li{
    //color: red;
  }
  .view {
    color: #000;
  }
  .infoNav{
    position:absolute; right:50px;
  }
  ul {list-style:none;}
  .nav {overflow:hidden;margin-bottom:50px;position:relative;}
  .nav .enroll{position:absolute; right:0;}
  .nav li {float:left; padding:3px;margin-right:28px;}
  .footer {text-align:center;}
  .footer a{text-decoration: none;}
</style>
