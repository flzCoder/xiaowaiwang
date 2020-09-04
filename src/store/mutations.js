import Vue from 'vue'

export default {
  setItem (state, { id, item }) {
    Vue.set(state.items, id, item)
  },
  delItem (state, { name, id }) {
    let res = state.items[name].res;
    let index = res.find((item,i) => {
      if (item.id === id) {
        return i;
      }
    })
    res.splice(index, 1);
    console.log('hahha',state.items[name],id);
  }
}
