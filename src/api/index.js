import axios from 'axios'

async function getIndex() {
  return await axios.get('http://47.93.34.232:8088/getIndex');
}

async function getRecommend() {
  return await axios.get('http://47.93.34.232:8088/getRecommend');
}

export function fetchMain (id) {
  return getIndex();
}

export function fetchRecommend (id) {
  return getRecommend();
}
