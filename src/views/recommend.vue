<template>
  <ul class="recommend main">
    <listItem :item='item' :key='i' v-for='(item, i) in list' />
  </ul>
</template>

<script>
import listItem from '../components/listItem.vue'
import axios from 'axios'

export default {
  title () {
    return this.title
  },
  asyncData ({ store, route }) {
    return store.dispatch('fetchRecommend', route.name)
  },
  computed: {
    list () {
      return this.$store.state.items[this.$route.name].res;
    }
  },
  components: {
    listItem
  },
  data() {
    return {
      title: '推荐'
    }
  }
}
</script>

<style lang="stylus" scoped>
.main {
  color: #000;
}
</style>
