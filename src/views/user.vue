<template>
  <div class="user main">
    <h3>欢迎回家{{username}}</h3>
    <div class="content">来吧~展示</div>
    <br />
    <br />
    <br />
  </div>
</template>

<script>
import axios from 'axios'

export default {
  title () {
    return this.title
  },
  asyncData () {
  },
  data() {
    return {
      title: '个人主页',
      username: ''
    }
  },
  mounted() {
    this.username = localStorage.getItem("username");
  },
  computed: {
  },
  methods: {
  }
}
</script>

<style lang="stylus">
.content{margin-top:20px; text-align:center;}
</style>
