import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const index = () => import('../views/index.vue')
const recommend = () => import('../views/recommend.vue')

export function createRouter () {
  return new Router({
    mode: 'history',
    routes: [
      { path: '/index', name:'index', component: index },
      { path: '/recommend', name:'recommend', component: recommend },
      { path: '/', redirect: '/index' }
    ]
  })
}
