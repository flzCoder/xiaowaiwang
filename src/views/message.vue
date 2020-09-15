<template>
  <div class="message main">
    <publish-thing></publish-thing>
    <div class="line"></div>
    <ul class="commentList">
      <comment :item='item' :key='i' v-for='(item, i) in list'></comment>
    </ul>
    <br/>
  </div>
</template>

<script>
import comment from '../components/comment.vue'
import publishThing from '../components/publish.vue'
import { EventBus } from '../store/eventBus'

export default {
  data() {
    return {
      title: '新鲜事'
    }
  },
  mounted() {},
  methods: {},
  title () {
    return this.title
  },
  asyncData ({ store, route }) {
    return store.dispatch('fetchMessage', route.name)
  },
  computed: {
    list () {
      return this.$store.state.items[this.$route.name].res;
    }
  },
  components: {
    comment,
    publishThing
  },
}
</script>

<style lang="stylus" scoped>
.commentList{
  width:800px;
  margin: 0 0 56px 26px;
}
.main {
  color: #000;
}
.message {
  min-height:578px;
}
.newsh {padding-bottom:25px;margin-left:26px;}
.line {border-bottom:1px solid #000; width:811px;margin:0 0 10px 40px;display: none;}
</style>
