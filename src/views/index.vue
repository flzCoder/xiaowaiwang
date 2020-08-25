<template>
  <ul class="index">
    <listItem :item='item' :key='i' v-for='(item, i) in list' />
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
  asyncData ({ store, route }) {
    return store.dispatch('fetchMain', route.name)
  },
  computed: {
    list () {
      return this.$store.state.items[this.$route.name].res;
    }
  },
  components: {
    listItem
  }
}
</script>

<style lang="stylus">
</style>
