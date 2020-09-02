<template>
  <div class="message main">
    <h3 class="title">信息列表</h3>
    <ul>
      <li v-text="item.program" :key='i' v-for='(item, i) in list'></li>
    </ul>
    <textarea name="name" v-model="message" rows="8" cols="80"></textarea>
    <div class="btn" @click='post'>发布</div>
    <br/>
    <br/>
    <br/>
  </div>
</template>

<script>
import axios from 'axios'

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
  methods: {
    post() {
      let content = this.message;
      let self = this;
      this.list.unshift({
        program:content
      });
      axios.post('http://47.93.34.232/:8088/postMessage', {
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
.title {
  text-align:left;
}
.btn {
  padding:5px;
  width:40px;
  border:1px solid #000;
  border-radius:3px;
  cursor:pointer;
}
.btn:active {
  color:#f2f2f2;
}
</style>
