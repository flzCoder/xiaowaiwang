import {
  fetchMain,
  fetchRecommend,
  fetchMessage,
  fetchUserList,
} from '../api'

export default {
  fetchMain ({ commit }, id) {
    return fetchMain(id).then(item => {
      item = item.data
      commit('setItem', { id, item })
    })
  },
  fetchRecommend ({ commit }, id) {
    return fetchRecommend(id).then(item => {
      item = item.data
      commit('setItem', { id, item })
    })
  },
  fetchMessage ({ commit }, id) {
    return fetchMessage(id).then(item => {
      item = item.data
      commit('setItem', { id, item })
    })
  },
  fetchUserList ({ commit }, id) {
    return fetchUserList(id).then(item => {
      item = item.data
      commit('setItem', { id, item })
    })
  }
}
