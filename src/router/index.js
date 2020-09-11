import Vue from 'vue'
import Router from 'vue-router'
const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}
Vue.use(Router)

const index = () => import('../views/index.vue')
const recommend = () => import('../views/recommend.vue')
const message = () => import('../views/message.vue')
const login = () => import('../views/login.vue')
const register = () => import('../views/register.vue')
const user = () => import('../views/user.vue')
const info = () => import('../views/info.vue')
const friend = () => import('../views/friend.vue')

export function createRouter () {
  return new Router({
    mode: 'history',
    routes: [
      { path: '/index', name:'index', component: index },
      { path: '/recommend', name:'recommend', component: recommend },
      { path: '/user', name:'user', component: user },
      { path: '/info', name:'info', component: info },
      { path: '/friend', name:'friend', component: friend },
      { path: '/message', name:'message', component: message },
      { path: '/login', name:'login', component: login },
      { path: '/register', name:'register', component: register },
      { path: '/', redirect: '/message' }
    ]
  })
}
