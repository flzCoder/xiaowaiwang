<template>
  <ul class="index">
    <listItem :item='item' :key='i' v-for='(item, i) in list' />
  </ul>
</template>

<script>
import listItem from '../components/listItem.vue'

export default {
  data() {
    return {
      ll: 'll'
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
