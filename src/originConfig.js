const originConfig = {
  development: {
    protocal: 'http',
    domain: 'flz.mudan.com',
    ip: '127.0.0.1',
    port: '8088'
  },
  production: {
    protocal: 'http',
    domain: 'www.fengluzhe.xyz',
    // domain: '82.157.148.14',
    ip: '82.157.148.14',
    port: '8088'
  }
}
let originInfo = originConfig[process.env.NODE_ENV]
let host = originInfo.domain ? originInfo.domain : originInfo.ip;
const prefixPath = `${originInfo.protocal}://${host}:${originInfo.port}`

export { prefixPath };
export default originConfig;
