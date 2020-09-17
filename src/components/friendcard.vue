<template>
  <li class="card">
    <div class="top">
      <img class="avator" :src="itemData.avator" alt=""/>
    </div>
    <div class="info">
      <div class="nickname">姓名：<span v-text="itemData.name"></span></div>
      <div class="num">编号：<span v-text="itemData.id"></span></div>
    </div>
    <div class="addBtn">加好友</div>
  </li>
</template>

<script>
import axios from 'axios'
import {
  prefixPath
} from '../originConfig'

export default {
  name: 'friendCard',
  data() {
    return {
      title: '好友名片',
    }
  },
  props: ['itemData'],
  created() {},
  computed: {

  },
  methods: {

  }
}
</script>

<style lang="stylus" scoped>
.card {
  float:left;
  width:148px;
  height: 263px;
  margin:0 13px 13px 0;
  border: 1px solid #848484;
  border-radius: 3px;
}
.top {
  width:100%;
  height:155px;
  overflow:hidden;
  display:flex;
  align-items: center;
}
.card .avator {
  width:100%;
}
.info{padding-left:6px;}
.nickname, .num{
  padding: 2px 0;
}
.addBtn{
  width: 66%;
  text-align:center;
  height:33px;
  line-height:33px;
  margin:12px auto 0;
  border-radius:3px;
  border:1px solid #FF0000;
  color:#FF0000;
  font-size:20px;
  background:#fff;
  cursor:pointer;
}
.addBtn:active{
  color:#000;
  border:1px solid #000;
}
</style>
