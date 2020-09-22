<template>
  <div class="friend">
    <div class="apply" v-if='applyedlist.length'>
      <h3>被好友申请</h3>
      <ul class='friendStatus applyedFriend'>
        <template v-for="(item, i) in applyedlist">
          <friend-card :key="i" :item-data="item" :type='"res"'></friend-card>
        </template>
      </ul>
    </div>
    <div class="apply" v-if='applyinglist.length'>
      <h3>主动申请好友</h3>
      <ul class='friendStatus applyingFriend'>
        <template v-for="(item, i) in applyinglist">
          <friend-card :key="i" :item-data="item" :type='"req"'></friend-card>
        </template>
      </ul>
    </div>
    <div class="agree" v-if='agreelist.length'>
      <h3>我的好友</h3>
      <ul class='friendStatus'>
        <template v-for="(item, i) in agreelist">
          <friend-card :key="i" :item-data="item" :type='"agree"'></friend-card>
        </template>
      </ul>
    </div>
    <div class="refuse" v-if='refuselist.length'>
      <h3>拒绝名单</h3>
      <ul class='friendStatus'>
        <template v-for="(item, i) in refuselist">
          <friend-card :key="i" :item-data="item" :type='"refuse"'></friend-card>
        </template>
      </ul>
    </div>
    <div class="block" v-if='blocklist.length'>
      <h3>屏蔽名单</h3>
      <ul class='friendStatus'>
        <template v-for="(item, i) in blocklist">
          <friend-card :key="i" :item-data="item" :type='"block"'></friend-card>
        </template>
      </ul>
    </div>
    <div class="rec" v-if='list.length'>
      <h3>推荐好友</h3>
      <ul class='friendStatus recommendFriend'>
        <template v-for="(item, i) in list">
          <friend-card :key="i" :item-data="item" :type='"rec"'></friend-card>
        </template>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import { prefixPath } from '../originConfig'
import friendCard from '../components/friendcard.vue'

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
    friendCard
  },
  methods: {
    getSoicalList(id) {
      axios.get(`${prefixPath}/getSoicalList?userid=${id}`)
      .then((res) =>{
        let socialData = res.data.res;
        console.log(123,socialData);

        this.applyedlist = socialData.filter(item => {
          return item.status === 0;
        });
        this.applyinglist = socialData.filter(item => {
          return item.friendid === this.info.id;
        });
        this.agreelist = socialData.filter(item => {
          return item.status === 1;
        });
        this.refuselist = socialData.filter(item => {
          return item.status === 2;
        });
        this.blocklist = socialData.filter(item => {
          return item.status === 3;
        });
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
