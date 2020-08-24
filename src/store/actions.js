import {
  fetchMain,
  fetchRecommend
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
  }
}
