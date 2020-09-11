<template>
  <li class="comment-item">
    <div class="info">
      <div class="name" v-text="item.name"></div>
      <div class="update_time" v-text="item.update_time"></div>
    </div>
    <div class="content" v-text="item.content"></div>
    <img class="pic" :src="item.pic" alt="" />
    <br>
    <div class="delbtn" v-show="item.id" @click="delComment()">删除</div>
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
    delComment() {
      let id = this.item.id;
      if (id) {
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
}
</script>

<style lang="stylus" scoped>
.comment-item {
  position: relative;
  width:100%;
  margin-bottom: 18px;
}
.comment-item img{
  width:100%;
}
.pic{
  padding-left:0;
  width:auto;
  margin:15px 0;
}
.info {
  overflow:hidden;
  border-bottom: 1px solid;
  padding-bottom: 3px;
}
.name{float:left;}
.update_time{float:right;}

img{padding-left:600px; width:200px;}
.delbtn {cursor:pointer;width:42px;margin-bottom:26px;}
</style>
