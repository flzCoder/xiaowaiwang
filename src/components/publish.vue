<template>
<div class="commentInput" v-show="!!info.id">
  <textarea placeholder="今天有什么新鲜事" name="name" v-model="message" rows="8" cols="80"></textarea>
  <div class="btn" @click='post'>发布</div>
  <label for="imgfile" class="imgfile">上传图片</label>
  <input type="file" name="imgfile" ref="imgfile" @change="dealFile()" v-show="false" id="imgfile" value="imgfile" />
  <img class="preload" :src='preloadurl' alt="">
</div>
</template>

<script>
import axios from 'axios'
import {
  prefixPath
} from '../originConfig'

export default {
  name: 'publishThing',
  data() {
    return {
      title: '新鲜事',
      message: '',
      imgfile: '',
      preloadurl: ''
    }
  },
  created() {},
  computed: {
    info() {
      return this.$store.state.info;
    }
  },
  methods: {
    dealFile(e) {
      let target = this.$refs.imgfile;
      let self = this;
      if (target.value) {
        var formData = new FormData();
        formData.append('files', target.files[0])
        axios({
            method: 'post',
            url: `${prefixPath}/postFile`,
            data: formData
          }).then(function(response) {
            self.preloadurl = `${prefixPath}/public/img/${response.data.picAddr}`;
          })
          .catch(function(error) {
            console.log('error', error);
          });
      }
    },
    post() {
      let content = this.message;
      let pic = this.preloadurl;
      let userid = this.info.id;
      let self = this;
      if (content && userid) {
        axios.post(`${prefixPath}/postMessage`, {
            content: content,
            userid: userid,
            pic: pic
          })
          .then(function(response) {
            let path = self.$router.history.current.path;
            if (path ==="/user") {
              self.$store.commit('pushUserItem', {
                id: self.info.id,
                item:{
                  content: content,
                  update_time: '今天',
                  name: self.info.name,
                  pic: pic
                }
              })
            } else if (path === '/message') {
              self.$store.commit('pushMessageItem', {
                id: 'message',
                item:{
                  content: content,
                  update_time: '今天',
                  name: self.info.name,
                  pic: pic
                }
              })
            }
            self.message = ''
            self.preloadurl = ''
          })
          .catch(function(error) {
            alert('服务器开小差了')
            console.log('error', error);
          });
      }
    }
  }
}
</script>

<style lang="stylus" scoped>
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
</style>
