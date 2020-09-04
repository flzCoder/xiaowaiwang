<template>
  <li class="comment-item">
    <div class="info">
      <div class="name" v-text="item.name"></div>
      <div class="update_time" v-text="item.update_time"></div>
    </div>
    <div class="content" v-text="item.content"></div>
    <br>
    <div class="delbtn" @click="delComment(item.id)">删除</div>
  </li>
</template>

<script>
import axios from 'axios'
import { prefixPath } from '../originConfig'
import { EventBus } from '../store/eventBus'

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
  },
  methods: {
    delComment(id) {
      axios.delete(`${prefixPath}/deleteMessage/${id}`)
      .then(function (response) {
        EventBus.$emit("delete", {
            id:id
        });
      })
      .catch(function (error) {
        alert('服务器开小差了')
        console.log('error',error);
      });
    }
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
.delbtn {cursor:pointer;}
</style>
