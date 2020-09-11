<template>
  <li class="news-item">
    <div class="left">
      <h4 class="title" v-text="item.title"></h4>
      <div class="content" v-text="item.content"></div>
      <div class="update_time" v-text="item.update_time"></div>
    </div>
    <img :src="item.pic" alt="">
  </li>
</template>

<script>
export default {
  name: 'news-item',
  props: ['item'],
  serverCacheKey: props => props.item.id + '::' + props.item.update_time,
  data() {
    return {
      title: '子孙标题'
    }
  },
  created() {
  }
}
</script>

<style lang="stylus" scoped>
.news-item {
  position: relative;
  width:914px;
  height:117px;
  margin-bottom: 18px;
}
.left {
  position:absolute;
  left: 0;
  width:600px;
}
img{padding-left:600px; width:200px;}
</style>
