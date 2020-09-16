<template>
  <div class="user main">
    <div class="line"></div>
    <ul class="commentList">
      <comment :item='item' :key='i' v-for='(item, i) in list'></comment>
    </ul>
    <div class="nocontent" v-show="isEmpty">快提醒小伙伴发布最新的状态吧</div>
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
    }
  },
  components: {
    comment,
  },
  mounted() {
    let id = location.search.split('=')[1];
    if (id) {
      this.getUserMessage(id);
    }
  },
  computed: {
    list () {
      return this.$store.state.items.friend;
    },
    isEmpty () {
      let list = this.$store.state.items.friend;
      if (list) {
        return !list.length;
      } else {
        return true;
      }
    }
  },
  methods: {
    getUserMessage(id) {
      axios.get(`${prefixPath}/getMessage?userid=${id}`)
      .then(res => {
        this.$store.commit('setItem', {
          id: 'friend',
          item: res.data.res
        })
      }).catch(ex => {})
    }
  }
}
</script>

<style lang="stylus" scoped>
.commentList{
  width:800px;
  margin: 0 0 56px 26px;
}
.user {
  min-height:500px;
}
.user h3,.user .content{ text-align:left; }
.username{ margin-bottom:20px; }
.content{ margin-top:20px; text-align:center; }
</style>
