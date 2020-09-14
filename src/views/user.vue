<template>
  <div class="user main">
    <h3 class="username">{{info.name}}</h3>
    <div class="newsh">新鲜事</div>
    <div class="line"></div>
    {{list}}
    <ul class="commentList">
      <comment :item='item' :key='i' v-for='(item, i) in userlist'></comment>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
import comment from '../components/comment.vue'
import { prefixPath } from '../originConfig'

export default {
  title () {
    return this.title
  },
  asyncData () {},
  data() {
    return {
      title: '个人主页',
      userlist: []
    }
  },
  components: {
    comment
  },
  mounted() {
  },
  computed: {
    info () {
      return this.$store.state.info;
    },
    list () {
      let id = this.info.id;
      if (id) {
        axios.get(`${prefixPath}/getMessage?userid=${id}`)
        .then(res => {
          this.userlist = res.data.res;
          return res.data.res;
        }).catch(ex => {})
      }
    }
  },
  methods: {
  }
}
</script>

<style lang="stylus" scoped>
.user {
  min-height:500px;
}
.user h3,.user .content{ text-align:left; }
.username{ margin-bottom:20px; }
.content{ margin-top:20px; text-align:center; }
</style>
