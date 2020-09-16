<template>
  <div class="friend">
    <h3>推荐好友</h3>
    <ul class='recommend'>
      <li>
        <img class="avator" src="" alt=""/>
        <div class="info">
          <span class="nickname"></span>
          <span class="location"></span>
        </div>
        <div class="addBtn">加好友</div>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  title () {
    return this.title
  },
  asyncData () {
  },
  data() {
    return {
      title: '寻找好友'
    }
  },
  mounted() {
  },
  computed: {
  },
  methods: {
  }
}
</script>

<style lang="stylus" scoped>
.friend {
  min-height:500px;
}
.friend h3,.information .content{ text-align:left; }
</style>
