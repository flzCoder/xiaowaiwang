<template>
  <div class="user information">
    <h3>个人资料修改</h3>
    <div class="content">敬请期待。。。</div>
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
      title: '资料修改',
      username: ''
    }
  },
  mounted() {
  },
  computed: {
  },
  methods: {
  }
}
</script>

<style lang="stylus">
.information {
  min-height:500px;
}
.information h3,.information .content{ text-align:left; }
.content{margin-top:20px; text-align:center;}
</style>
