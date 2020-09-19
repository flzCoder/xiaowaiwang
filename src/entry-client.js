import Vue from 'vue'
import 'es6-promise/auto'
import { createApp } from './app'
import { prefixPath } from './originConfig'
import axios from 'axios'




Vue.mixin({
  beforeRouteUpdate (to, from, next) {
    const { asyncData } = this.$options
    if (asyncData) {
      asyncData({
        store: this.$store,
        route: to
      }).then(next).catch(next)
    } else {
      next()
    }
  }
})

const { app, router, store } = createApp()

if (window.__INITIAL_STATE__) {
  store.replaceState(window.__INITIAL_STATE__)
}

// console.log(111222);
// axios.get(`${prefixPath}/getInfo`)
// .then((res) =>{
//   let data = res.data;
//   if (data.code === 200) {
//     store.commit('setInfo', {
//       id: 'name',
//       item: data.res[0].name
//     })
//     store.commit('setInfo', {
//       id: 'avator',
//       item: data.res[0].avator
//     })
//     store.commit('setInfo', {
//       id: 'id',
//       item: data.res[0].id
//     })
//     store.commit('setLoged', {
//       mine: true,
//       btn: false
//     })
//   } else {
//     store.commit('setLoged', {
//       mine: false,
//       btn: true
//     })
//   }
// })
// .catch((err) => {
//   store.commit('setLoged', {
//     mine: false,
//     btn: true
//   })
// })

router.onReady(() => {
  router.beforeResolve((to, from, next) => {
    const matched = router.getMatchedComponents(to)
    const prevMatched = router.getMatchedComponents(from)

    let diffed = false
    const activated = matched.filter((c, i) => {
      return diffed || (diffed = (prevMatched[i] !== c))
    })

    if (!activated.length) {
      return next()
    }

    Promise.all(activated.map(c => {
      if (c.asyncData) {
        return c.asyncData({ store, route: to })
      }
    })).then(() => {
      next()
    }).catch(next)
  })

  app.$mount('#app')
})

if ('https:' === location.protocol && navigator.serviceWorker) {
  navigator.serviceWorker.register('/service-worker.js')
}
