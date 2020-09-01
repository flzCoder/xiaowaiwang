<template>
  <ul class="index">
    首页的内容
    <!-- <listItem :item='item' :key='i' v-for='(item, i) in list' /> -->
  </ul>
</template>

<script>
import listItem from '../components/listItem.vue'

export default {
  title () {
    return this.title
  },
  data() {
    return {
      title: '首页'
    }
  },
  asyncData11 ({ store, route }) {
    return store.dispatch('fetchMain', route.name)
  },
  asyncData () {},
  computed: {
    list11 () {
      //return this.$store.state.items[this.$route.name].res;
      return 111;
    }
  },
  components: {
    listItem
  }
}
</script>

<style lang="stylus">
</style>
