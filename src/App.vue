<template>
  <div id="app">
    网易手机网
    <ul class='nav'>
      <router-link :to="'./index'"><li>首页</li></router-link>
      <router-link :to="'./recommend'"><li>推荐</li></router-link>
    </ul>
    <router-view class="view"></router-view>
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
  }
  .router-link-active li{
    text-decoration: underline;
    color: red;
  }
  .view {
    color: #000;
    padding-left: 66px;
  }
  ul {list-style:none;}
  .nav {overflow:hidden;}
  .nav li {float:left; padding:3px;}
</style>
