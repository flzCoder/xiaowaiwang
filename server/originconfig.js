const originConfig = {
  development: {
    protocal: 'http',
    domain: 'flz.mudan.com',
    ip: '127.0.0.1',
    port: '8088'
  },
  production: {
    protocal: 'http',
    domain: 'www.fengluzhe.shop',
    ip: '182.92.163.121',
    port: '8088'
  }
}

let originInfo = originConfig[process.env.NODE_ENV]
let host = originInfo.domain ? originInfo.domain : originInfo.ip;
const prefixPath = `${originInfo.protocal}://${host}:${originInfo.port}`
originConfig.prefixPath = prefixPath;

module.exports = originConfig
