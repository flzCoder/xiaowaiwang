import axios from 'axios'

export function fetchItem (id) {
  return axios.get('http://flz.163.com:8088/getRecommend');
}
