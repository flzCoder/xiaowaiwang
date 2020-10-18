<template>
  <li :class="'card ' +type">
    <div class="top">
      <img class="avator" :src="itemData.avator" alt=""/>
    </div>
    <div class="info">
      <div class="nickname">姓名：<span class='nickname' v-text="itemData.name"></span></div>
      <div class="num">编号：<span v-text="friendid"></span></div>
    </div>
    <div class="btntips">
      <div class="normal" v-if="type === 'rec'" @click='addfriend' v-text="btnTxt"></div>
      <div :class="'request ' + reqresult" v-if="(type === 'req' && !applyedType) || (type === 'total' && applystyle)" v-text="reciveresult"></div>
      <div class="response" v-if="(type === 'res' || applyedType) || (type === 'total' && !applystyle)">
        <div class="replaybtn" v-show='!replayedTxt'>
          <a class="agree" @click='reply(1)'>同意</a>
          <a class="refuse" @click='reply(2)'>拒绝</a>
          <a class="block" @click='reply(3)'>屏蔽</a>
        </div>
        <div class="normal responseResult" v-show='replayedTxt' v-text="replayedTxt"></div>
      </div>
    </div>
  </li>
</template>

<script>
import axios from 'axios'
import {
  prefixPath
} from '../originConfig'

export default {
  name: 'friendCard',
  data() {
    return {
      title: '好友名片',
      friendid: '',
      reqresult: '',
      btnTxt: '加好友',
      replayedTxt: '',
      reciveresult: '已向对方发申请',
      applyedType: false,
      applystyle: false,
    }
  },
  props: ['itemData', 'type'],
  created() {},
  mounted() {
    this.dealinit();
    this.dealapplying();
    this.dealapplyed();
  },
  computed: {
    info () {
      return this.$store.state.info;
    }
  },
  methods: {
    dealinit() {
      if (this.type ==='req' && (this.itemData.friendid !== this.info.id) && (this.itemData.status === 0)) {
        this.applyedType = true;
      }
      if (this.type ==='rec') {
        this.friendid = this.itemData.id;
      } else {
        this.friendid = this.itemData.friendid === this.info.id ? this.itemData.userid : this.itemData.friendid;
      }
      this.applystyle = !!(this.itemData.friendid === this.info.id);
    },
    dealapplying() {
      let status = this.itemData.status
      if (status === 1) {
        this.reqresult = 'reqresult'
        this.reciveresult = '对方已同意'
      } else if (status === 2 || status === 3) {
        this.reqresult = 'reqresult'
        this.reciveresult = '对方已拒绝'
      }
    },
    dealapplyed() {
      let status = this.itemData.status
      if (status === 1) {
        this.replayedTxt = '已同意'
      } else if (status === 2) {
        this.replayedTxt = '已拒绝'
      } else if (status === 3) {
        this.replayedTxt = '已屏蔽'
      }
    },
    addfriend() {
      this.btnTxt = '申请已发送';
      if (this.info.id) {
        axios({
            method: 'post',
            url: `${prefixPath}/addfriend`,
            data: {
              'userid': this.itemData.id,
              'friendid': this.info.id
            }
          }).then(function(response) {
            console.log('response',response);
          })
          .catch(function(error) {
            console.log('error', error);
          });
      } else {
        alert('请先登录')
      }

    },
    reply(status) {
      let self = this;
      let id = this.itemData.id;
      axios({
          method: 'post',
          url: `${prefixPath}/reply`,
          data: { id, status }
        }).then(function(res) {
          if (status === 1) {
            self.replayedTxt = '已同意';
          } else if (status === 2) {
            self.replayedTxt = '已拒绝';
          } else if (status === 3) {
            self.replayedTxt = '已屏蔽';
          }
        })
        .catch(function(err) {
          console.log('error', err);
        });
    }
  }
}
</script>

<style lang="stylus" scoped>
.nickname {
  overflow: hidden;
  text-overflow:ellipsis;
  white-space:nowrap;
}
.card {
  float:left;
  width:148px;
  height: 263px;
  margin:0 13px 13px 0;
  border: 1px solid #848484;
  border-radius: 3px;
}
.total {
  width: 101px;
  height: 187px;
}
.total .top {
  height: 102px;
}
.total .info {
  font-size: 15px;
}
.total .replaybtn {
  font-size: 12px;
  margin-top: -2px;
}
.total .replaybtn a{
  margin: 0 2px;
}
.total .request, .total .responseResult {
  height: 16px;
  line-height: 16px;
  width: 89%;
  font-size: 12px;
}
.total .reqresult, .total .responseResult {
  border: 1px solid #2932e1;
  color:#2932e1;
}
.agree .card, .block .card, .refuse .card {
  height: 210px;
}
.applying .card {
  height: 227px;
}
.top {
  width:100%;
  height:155px;
  overflow:hidden;
  display:flex;
  align-items: center;
}
.card .avator {
  width:100%;
}
.info{padding-left:6px;}
.nickname, .num{
  padding: 2px 0;
}
.normal, .request{
  width: 76%;
  text-align:center;
  height:33px;
  line-height:33px;
  margin:12px auto 0;
  border-radius:3px;
  border:1px solid #e10602;
  color:#e10602;
  font-size:20px;
  background:#fff;
  cursor:pointer;
}
.request, .responseResult{
  height:24px;
  line-height:24px;
  width: 82%;
  font-size:16px;
}
.normal:active, .response a:active{
  color:#000;
  border:1px solid #000;
}
.response {
  margin-top:13px;
}
.response a{
  cursor:pointer;
  border-radius:3px;
  border:1px solid #FF0000;
  color:#FF0000;
  display: inline-block;
  margin: 0 3px;
  width: 27%;
  text-align: center;
}
</style>
