import Vue from 'vue'

export default {
  setItem (state, { id, item }) {
    Vue.set(state.items, id, item)
  },
  pushMessageItem (state, { id, item }) {
    state.items[id].res.unshift(item);
  },
  deleteMessageItem (state, { id, delid }) {
    state.items[id].res.forEach(function(item, index, arr) {
       if(item.id == delid) {
           arr.splice(index, 1);
       }
   });
  },
  deleteUserItem (state, { id, delid }) {
    state.items[id].forEach(function(item, index, arr) {
       if(item.id == delid) {
           arr.splice(index, 1);
       }
   });
  },
  pushUserItem (state, { id, item }) {
    state.items[id].unshift(item);
  },
  setInfo (state, { id, item }) {
    Vue.set(state.info, id, item)
  },
  setLoged (state, isloged) {
    Vue.set(state, 'isloged', isloged)
  },
  delItem (state, { name, id }) {
    let res = state.items[name].res;
    let index = res.find((item,i) => {
      if (item.id === id) {
        return i;
      }
    })
    res.splice(index, 1);
  }
}
