import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

const index = () => import('../views/index.vue')
const recommend = () => import('../views/recommend.vue')
const message = () => import('../views/message.vue')
const login = () => import('../views/login.vue')
const user = () => import('../views/user.vue')

export function createRouter () {
  return new Router({
    mode: 'history',
    routes: [
      { path: '/index', name:'index', component: index },
      { path: '/recommend', name:'recommend', component: recommend },
      { path: '/user', name:'user', component: user },
      { path: '/message', name:'message', component: message },
      { path: '/login', name:'login', component: login },
      { path: '/', redirect: '/message' }
    ]
  })
}
