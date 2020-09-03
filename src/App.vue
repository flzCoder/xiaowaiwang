<template>
  <div id="app">
    <h3>网易手机网</h3>
    <ul class='nav'>
      <router-link :to="'./index'"><li>首页</li></router-link>
      <router-link :to="'./recommend'"><li>推荐</li></router-link>
      <router-link :to="'./message'"><li>发帖</li></router-link>
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
  .nav {overflow:hidden;}
  .nav li {float:left; padding:3px;}
</style>
