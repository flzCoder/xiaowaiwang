<template>
  <div class="user main">
    <publish-thing></publish-thing>
    <div class="line"></div>
    <ul class="commentList">
      <comment :item='item' :key='i' v-for='(item, i) in list'></comment>
    </ul>
    <div class="nocontent" v-show="isEmpty">快来发布最新的状态吧</div>
  </div>
</template>

<script>
import axios from 'axios'
import comment from '../components/comment.vue'
import publishThing from '../components/publish.vue'
import { prefixPath } from '../originConfig'

export default {
  title () {
    return this.title
  },
  asyncData () {},
  data() {
    return {
      title: '个人主页'
    }
  },
  components: {
    comment,
    publishThing
  },
  mounted() {
    let id = this.info.id;
    if (id) {
      this.getUserMessage(id);
    }
  },
  watch: {
    info(val) {
      let id = val.id;
      if (id) {
        this.getUserMessage(id);
      }
    }
  },
  computed: {
    info () {
      return this.$store.state.info;
    },
    list () {
      return this.$store.state.items[this.info.id];
    },
    isEmpty () {
      let list = this.$store.state.items[this.info.id];
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
          id: this.info.id,
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
