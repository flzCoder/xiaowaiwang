<template>
  <div class="message main">
    <div class="commentInput">
      <textarea placeholder="今天有什么新鲜事" name="name" v-model="message" rows="8" cols="80"></textarea>
      <div class="btn" @click='post'>发布</div>
    </div>
    <div class="newsh">新鲜事</div>
    <div class="line"></div>
    <ul class="commentList">
      <comment :item='item' :key='i' v-for='(item, i) in list'></comment>
    </ul>
    <br/>
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
  asyncData ({ store, route }) {
    return store.dispatch('fetchMessage', route.name)
  },
  computed: {
    list () {
      return this.$store.state.items[this.$route.name].res;
    }
  },
  components: {
    comment
  },
  methods: {
    post() {
      let content = this.message;
      let self = this;
      if (content) {
        this.list.unshift({
          content:content,
          update_time: '今天'
        });
        axios.post(`${prefixPath}/postMessage`, {
            content: content
          })
          .then(function (response) {
            self.message =''
          })
          .catch(function (error) {
            alert('服务器开小差了')
            console.log('error',error);
          });
      }
    }
  },
  data() {
    return {
      title: '留言',
      message: ''
    }
  }
}
</script>

<style lang="stylus">
.main {
  color: #000;
}
.commentInput {
  margin:0 0 28px 26px;
  position:relative;
  width: 800px;
  height:66px;
}
.commentList {
  width:700px;
  margin-left:80px;
}
textarea {
  resize:none;
  outline: none;
  padding: 2px 6px;
  width: calc(100% - 14px);
  height: 60px;
  border-radius: 0px;
}

textarea::-webkit-input-placeholder{
  height: 60px;line-height: 60px
}
textarea:-moz-placeholder{
  height: 60px;line-height: 60px
}
textarea::-moz-placeholder{
  height: 60px;line-height: 60px
}
textarea:-ms-input-placeholder{
  height: 60px;line-height: 60px
}

.btn {
  border: 1px solid #000;
  border-left:none;
  text-align: center;
  position:absolute;
  height:64px;
  line-height:64px;
  right:-61px;
  top: 0;
  padding: 0 10px;
  width:40px;
  cursor:pointer;
}
.btn:active {
  color:#f2f2f2;
}
.newsh {padding-bottom:25px;margin-left:26px;}
.line {border-bottom:1px solid #000; width:811px;margin:0 0 10px 40px;display: none;}
.content {
  padding: 5px 0 0 0;
}
</style>
