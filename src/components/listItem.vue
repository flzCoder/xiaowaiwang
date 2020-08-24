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
  name: 'listItem',
  props: ['item'],
  data() {
    return {
      cc: '这是个新闻'
    }
  },
  methods: {
    dd() {
      return "nb";
    }
  }
}
</script>

<style lang="stylus">
.news-item {
  position:relative;
}
.left {
  position:absolute;
  left: 0;
  width:600px;
}
img{padding-left:600px; width:200px;}
</style>
