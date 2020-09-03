<template>
  <li class="comment-item">
    <div class="info">
      <div class="name" v-text="item.name"></div>
      <div class="update_time" v-text="item.update_time"></div>
    </div>
    <div class="content" v-text="item.content"></div>
  </li>
</template>

<script>
import utils from "../util/util.js"
export default {
  name: 'comment-item',
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

<style lang="stylus">
.comment-item {
  position: relative;
  width:100%;
  height:117px;
  margin-bottom: 18px;
}
.info {
  overflow:hidden;
  border-bottom: 1px solid;
  padding-bottom: 3px;
}
.name{float:left;}
.update_time{float:right;}

img{padding-left:600px; width:200px;}
</style>
