import axios from 'axios'
import { prefixPath } from '../originConfig'

async function getIndex() {
  return await axios.get(`${prefixPath}/getIndex`);
}

async function getRecommend() {
  return await axios.get(`${prefixPath}/getRecommend`);
}

async function getMessage() {
  return await axios.get(`${prefixPath}/getMessage`);
}

async function getUserList() {
  return await axios.get(`${prefixPath}/getUserList`);
}

export function fetchMain (id) {
  return getIndex();
}

export function fetchRecommend (id) {
  return getRecommend();
}

export function fetchMessage (id) {
  return getMessage();
}

export function fetchUserList (id) {
  return getUserList();
}
