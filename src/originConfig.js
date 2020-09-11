const originConfig = {
  dev: {
    protocal: 'http',
    domain: 'flz.mudan.com',
    ip: '127.0.0.1',
    port: '8088'
  },
  prod: {
    protocal: 'http',
    domain: '',
    ip: '47.93.34.232',
    port: '8088'
  },
  production: {
    protocal: 'http',
    domain: 'flz.mudan.com',
    ip: '127.0.0.1',
    port: '8088'
  }
}
let originInfo = originConfig[process.env.NODE_ENV]
let host = originInfo.domain ? originInfo.domain : originInfo.ip;
const prefixPath = `${originInfo.protocal}://${host}:${originInfo.port}`

export { prefixPath };
export default originConfig;
