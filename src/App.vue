<template>
  <div id="app">
    <h3 class="website">校外网</h3>
    <ul class='nav'>
      <router-link :to="'./index'"><li>资讯</li></router-link>
      <router-link :to="'./recommend'"><li>信息流</li></router-link>
      <router-link :to="'./message'"><li>发帖</li></router-link>
      <router-link :to="'./login'"><li>登录</li></router-link>
    </ul>
    <router-view class="view"></router-view>
    <a href="http://beian.miit.gov.cn/" target="_blank">浙ICP备2020032336号</a>
  </div>
</template>

<script>
export default {
  data() {
    return {
      aa: 15
    }
  },
  created() {
  },
  methods: {
    bb(num) {
      return ++num;
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

  h3
   text-align:center

  .router-link-active li{
    text-decoration: underline;
    color: red;
  }
  .view {
    color: #000;
  }
  ul {list-style:none;}
  .nav {overflow:hidden;margin-bottom:20px;}
  .nav li {float:left; padding:3px;margin-right:28px;}
</style>
