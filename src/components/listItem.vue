<template>
  <li class="news-item">
    <h4 class="title" v-text="item.title"></h4>
    <div class="content" v-text="item.content"></div>
  </li>
</template>

<script>
export default {
  name: 'listItem',
  props: ['item'],
  data() {
    return {
      cc: '这是个新闻'
    }
  },
  methods: {
    dd() {
      return "nb";
    }
  }
}
</script>

<style lang="stylus">

</style>
