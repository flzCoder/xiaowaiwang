<template>
  <div class="friend">
    <div class="applyinfo" v-if='applytotallist.length'>
      <h3>申请信息</h3>
      <ul class='friendStatus applyinfo'>
        <template v-for="(item, i) in applytotallist">
          <social-card :key="i" :item-data="item" :type='"total"'></social-card>
        </template>
      </ul>
    </div>
    <div class="agree" v-if='agreelist.length'>
      <h3>我的好友</h3>
      <ul class='friendStatus'>
        <template v-for="(item, i) in agreelist">
          <social-card :key="i" :item-data="item" :type='"agree"'></social-card>
        </template>
      </ul>
    </div>
    <div class="rec" v-show='reclist.length'>
      <h3>推荐好友</h3>
      <ul class='friendStatus recommendFriend'>
        <template v-for="(item, i) in reclist">
          <social-card :key="i" :item-data="item" :type='"rec"'></social-card>
        </template>
      </ul>
    </div>
    <div class="applying" v-if='applyinglist.length && false'>
      <h3>主动申请好友</h3>
      <ul class='friendStatus applyingFriend'>
        <template v-for="(item, i) in applyinglist">
          <social-card :key="i" :item-data="item" :type='"req"'></social-card>
        </template>
      </ul>
    </div>
    <div class="applyed" v-if='applyedlist.length && false'>
      <h3>被好友申请</h3>
      <ul class='friendStatus applyedFriend'>
        <template v-for="(item, i) in applyedlist">
          <social-card :key="i" :item-data="item" :type='"res"'></social-card>
        </template>
      </ul>
    </div>
    <div class="refuse" v-if='refuselist.length && false'>
      <h3>拒绝名单</h3>
      <ul class='friendStatus'>
        <template v-for="(item, i) in refuselist">
          <social-card :key="i" :item-data="item" :type='"refuse"'></social-card>
        </template>
      </ul>
    </div>
    <div class="block" v-if='blocklist.length && false'>
      <h3>屏蔽名单</h3>
      <ul class='friendStatus'>
        <template v-for="(item, i) in blocklist">
          <social-card :key="i" :item-data="item" :type='"block"'></social-card>
        </template>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { prefixPath } from '../originConfig'
import socialCard from '../components/social.vue'

export default {
  title () {
    return this.title
  },
  asyncData ({ store, route }) {
    return store.dispatch('fetchUserList', route.name)
  },
  data() {
    return {
      title: '寻找好友',
      reclist: [],
      applytotallist: [],
      applyedlist: [],
      applyinglist: [],
      agreelist: [],
      refuselist: [],
      blocklist: []
    }
  },
  mounted() {
    let id = this.info.id;
    if (id) {
      this.getSoicalList(id);
    }
  },
  watch: {
    info(val) {
      let id = val.id;
      if (id) {
        this.getSoicalList(id);
      }
    }
  },
  computed: {
    info () {
      return this.$store.state.info;
    },
    list () {
      return this.$store.state.items[this.$route.name].res;
    }
  },
  components: {
    socialCard
  },
  methods: {
    getSoicalList(id) {
      axios.get(`${prefixPath}/getSoicalList?userid=${id}`)
      .then((res) =>{
        let socialData = res.data.res;
        this.applytotallist = socialData;
        this.applyinglist = socialData.filter(item => {
          return (item.friendid === this.info.id);
        });
        this.agreelist = socialData.filter(item => {
          return item.status === 1;
        });
        this.applyedlist = socialData.filter(item => {
          return item.status === 0 && item.friendid !== this.info.id;
        });
        this.refuselist = socialData.filter(item => {
          return item.status === 2 && item.friendid !== this.info.id;
        });
        this.blocklist = socialData.filter(item => {
          return item.status === 3 && item.friendid !== this.info.id;
        });
        let socialedlist = [this.info.id];
        socialData.filter(item => {
          if (item.status !== 2) {
            if (item.friendid === this.info.id) {
              socialedlist.push(item.userid);
            } else if (item.userid === this.info.id) {
              socialedlist.push(item.friendid);
            }
          }
        });
        socialedlist = [...new Set(socialedlist)];
        this.reclist = this.list.filter((item,index,arr) => {
          let temp = socialedlist.find(id => {
            return id === item.id;
          })
          return !temp;
        })
      })
      .catch((err) => {
        console.log(err);
      })
    }
  }
}
</script>

<style lang="stylus" scoped>
.friend {
  min-height:500px;
}
.friendStatus {
  margin-top:10px;
  overflow: hidden;
}
.friend h3,.information .content{ text-align:left; }

</style>
