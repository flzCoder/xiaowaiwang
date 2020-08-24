import Vue from 'vue'

export default {
  setItem (state, { id, item }) {
    Vue.set(state.items, id, item)
  }
}
