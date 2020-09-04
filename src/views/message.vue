<template>
  <div class="message main">
    <div class="commentInput">
      <textarea placeholder="今天有什么新鲜事" name="name" v-model="message" rows="8" cols="80"></textarea>
      <div class="btn" @click='post'>发布</div>
      <label for="imgfile" class="imgfile">上传图片</label>
      <input type="file" name="imgfile" ref="imgfile" @change="dealFile()" v-show="false" id="imgfile" value="imgfile" />
      <img class="preload" :src='preloadurl' alt="">
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
import { EventBus } from '../store/eventBus'

export default {
  data() {
    return {
      title: '留言',
      message: '',
      imgfile: '',
      preloadurl: ''
    }
  },
  mounted() {
    let name = this.$route.name;
     EventBus.$on("delete", ({ id }) => {
       this.$store.commit('delItem', { name, id })
     });
  },
  methods: {
    dealFile(e) {
      let target = this.$refs.imgfile;
      let self = this;
      if(target.value){
          var formData = new FormData();
          formData.append('files', target.files[0])
          axios({
            method: 'post',
            url: `${prefixPath}/postFile`,
            data: formData
          }).then(function (response) {
            self.preloadurl = `${prefixPath}/public/img/${response.data.picAddr}`;
            console.log('success',response);
          })
          .catch(function (error) {
            console.log('error',error);
          });
      }
    },
    post() {
      let content = this.message;
      let pic = this.preloadurl;
      let self = this;
      if (content) {
        this.list.unshift({
          content:content,
          update_time: '今天',
          name: '默认小王',
          pic: pic
        });
        axios.post(`${prefixPath}/postMessage`, {
            content: content,
            name: '默认小王',
            pic: pic
          })
          .then(function (response) {
            self.message =''
            self.preloadurl =''
          })
          .catch(function (error) {
            alert('服务器开小差了')
            console.log('error',error);
          });
      }
    }
  },
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
}
</script>

<style lang="stylus">
.main {
  color: #000;
}
.message {
  min-height:578px;
}
.commentInput {
  margin:0 0 56px 26px;
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
.imgfile {cursor:pointer;}
.preload {position:absolute; top: 70px; left:89px;padding-left:0;width:auto; height:43px;}
.newsh {padding-bottom:25px;margin-left:26px;}
.line {border-bottom:1px solid #000; width:811px;margin:0 0 10px 40px;display: none;}
.content {
  padding: 5px 0 0 0;
}
</style>
