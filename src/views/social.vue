<template>
  <div class="friend">
    <h3>推荐好友</h3>
    <ul class='recommendFriend'>
      <template v-for="(item, i) in list">
        <friend-card :key="i" :item-data="item"></friend-card>
      </template>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
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
      title: '寻找好友'
    }
  },
  mounted() {
  },
  computed: {
    list () {
      return this.$store.state.items[this.$route.name].res;
    }
  },
  components: {
    friendCard
  },
  methods: {
  }
}
</script>

<style lang="stylus" scoped>
.friend {
  min-height:500px;
}
.recommendFriend {
  margin-top:10px;
}
.friend h3,.information .content{ text-align:left; }
</style>
