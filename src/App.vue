<template>
  <div id="app">
    <h3 class="website"><span><a href="/">FUNNY</a></span><i>中国人必备的PC社交网络</i></h3>
    <ul class='nav'>
      <router-link :to="'./message'" v-show="true"><li><span>新鲜事</span></li></router-link>
      <router-link :to="'./user'" v-show="isloged.mine"><li><span>个人主页</span></li></router-link>
      <router-link :to="'./index'" v-show="false"><li>首页</li></router-link>
      <router-link :to="'./social'" v-show="true"><li><span>好友</span></li></router-link>
      <router-link :to="'./recommend'" v-show="false"><li>资讯</li></router-link>
      <router-link :to="'./info'" class="infoNav" v-show="isloged.mine"><li><span>欢迎您:{{info.name}}</span></li></router-link>
      <router-link :to="'./register'"><li class="register"><span v-show="isloged.btn">注册</span></li></router-link>
      <router-link :to="'./login'"><li class="enroll"><span v-show="isloged.btn">登录</span><span v-show="isloged.mine" class="logout" @click.prevent='logout'>退出</span></li></router-link>
    </ul>
    <router-view class="view"></router-view>

    <!-- <h3 class="website">快乐天地-快乐旺旺乐翻天</h3>
    <div class='content'>
      个人练习网站：快乐天地
    </div> -->

    <div class="footer">
      <a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11010802038349" target="_blank">京公网安备11010802038349号</a>
      <br />
      <br />
      <a href="http://beian.miit.gov.cn/" target="_blank" v-text="icptxt"></a>
      <br />
      <br />
      <br />
    </div>
  </div>
</template>

<script>
import { EventBus } from './store/eventBus'
import { prefixPath } from './originConfig'
import cookie from './util/cookie'
import axios from 'axios'
axios.defaults.withCredentials = true;
export default {
  data() {
    return {
      icptxt: '浙ICP备2020032336号-3'
    }
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
    let temp = prefixPath
    if (window.location.href.indexOf('fengluzhe.xyz')>-1) {
      this.icptxt = '浙ICP备2020032336号-2'
      temp = 'http://fengluzhe.xyz:8088'
    }
    let hascookie = cookie.getCookie('skr');
    if (!hascookie) {
      // cookie.setCookie('skr', 's%3A3934f75c8cc41d92173f1873a0b6299d.O6kGgZBpD0SeoTDQtsQXi%2FeGJiwrw%2B6%2Betq8cKJRlnI', 10*365)
      cookie.setCookie('skr', 's%3Ad220a9e3b3e8b3ca5a3108d24e43ea75.NSNDMnayF6Y1gUvoTIqIYBYCjt7KoSrmAUWBtcWKAyA', 10*365)
    }
    axios.get(`${temp}/getInfo`, {
      withCredentials: true
    })
    .then((res) =>{
      let data = res.data;
      if (data.code === 200) {
        this.$store.commit('setInfo', {
          id: 'name',
          item: data.res[0].name
        })
        this.$store.commit('setInfo', {
          id: 'avator',
          item: data.res[0].avator
        })
        this.$store.commit('setInfo', {
          id: 'mobilephone',
          item: data.res[0].mobilephone
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
      axios.get(`${prefixPath}/logout`, {
        withCredentials: true
      })
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
            id: 'avator',
            item: ''
          })
          this.$store.commit('setInfo', {
            id: 'mobilephone',
            item: ''
          })
          this.$store.commit('setInfo', {
            id: 'id',
            item: ''
          })
        }
        this.$router.push('./message')
      })
      .catch((err) => {})
    }
  }
}

</script>

<style lang="stylus">
  *{margin:0;padding:0;}
  a{text-decoration:none;}
  .website{padding: 3px 0 12px 0; color:#1e3e23;}
  .website i{font-style:normal;cursor:default;}
  .website span{margin-right:20px; font-size:30px;}
  #app {
    width:980px;
    margin:0 auto;
  }
  .logout {
    margin-left:10px;
    color: #000;
  }

  .router-link-active li span{
    border-bottom: 2px solid red;
    padding-bottom:2px;
  }
  .view {
    color: #000;
  }
  .infoNav{
    position:absolute; right:50px;
  }
  ul {list-style:none;}
  .nav {overflow:hidden;padding-bottom:50px;position:relative;}
  .nav .register{position:absolute; right:69px;}
  .nav .enroll{position:absolute; right:0;}
  .nav li {float:left; margin-right:28px;font-size:22px;}
  .footer {text-align:center;}
  .footer a{text-decoration: none;}
</style>
