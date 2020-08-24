<template>
  <ul class="recommend main">
    <listItem :item='item' :key='i' v-for='(item, i) in list' />
  </ul>
</template>

<script>
import listItem from '../components/listItem.vue'
import axios from 'axios'

export default {
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
      kk: 'kk',
      list11: [
        {name:'标题1',con:'看天下看天下看天下看天下看天下看天下'},
        {name:'标题1',con:'看天下看天下看天下看天下看天下看天下'},
        {name:'标题1',con:'看天下看天下看天下看天下看天下看天下'},
        {name:'标题1',con:'看天下看天下看天下看天下看天下看天下'},
        {name:'标题1',con:'看天下看天下看天下看天下看天下看天下'}
      ]
    }
  }
}
</script>

<style lang="stylus">
.main {
  color: #000;
}
</style>
