<template>
  <div class="friend">
    <h3>寻找好友</h3>
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
      title: '寻找好友',
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

<style lang="stylus" scoped>
.friend {
  min-height:500px;
}
.friend h3,.information .content{ text-align:left; }
.content{margin-top:20px; text-align:left;}
</style>
