<template>
  <li class="comment-item">
    <div class="info">
      <div class="name"><img class="avator" :src="item.avator" /><a :href="userurl" target="_blank" v-text="item.name"></a></div>
      <div class="update_time" v-text="item.update_time"></div>
    </div>
    <div class="content" v-text="item.content"></div>
    <a :href="item.pic" target="_blank" v-if='item.pic'><img :src="item.pic" class="pic" alt="" /></a>
    <br>
    <div class="delbtn" v-show="item.id && info.name === item.name" @click="delComment()">删除</div>
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
      title: '子孙标题',
    }
  },
  created() {
  },
  mounted() {
  },
  computed: {
    info () {
      return this.$store.state.info;
    },
    userurl (val) {
      let targetUrl = this.item.userid === this.info.id ? '/user' :  `/friend?id=${this.item.userid}`;
      return targetUrl;
    }
  },
  methods: {
    delComment() {
      let id = this.item.id;
      let self = this;
      if (id) {
        axios.delete(`${prefixPath}/deleteMessage/${id}`)
        .then(function (response) {
          let path = self.$router.history.current.path;
          if (path ==="/user") {
            self.$store.commit('deleteUserItem', {
              id: self.info.id,
              delid: id
            })
          } else if (path === '/message' || path === '/') {
            self.$store.commit('deleteMessageItem', {
              id: 'message',
              delid: id
            })
          }
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
.comment-item .pic{
  height:200px;
}
.pic{
  padding-left:0;
  width:auto;
  margin:15px 0;
}
.info {
  position:relative;
  overflow:hidden;
  border-bottom: 1px solid;
  padding-bottom: 3px;
}
.name{float:left;}
.name a{text-decoration:none}
.update_time{
  bottom: 2px;
  position: absolute;
  right: 0;
}
.avator {width:30px; margin-right:10px;}
.delbtn {cursor:pointer;width:42px;margin-bottom:26px;}
</style>
