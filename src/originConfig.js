const originConfig = {
  development: {
    protocal: 'http',
    domain: 'flz.mudan.com',
    ip: '127.0.0.1',
    port: '8088'
  },
  production: {
    protocal: 'http',
    domain: process.env.hostname.indexOf('.xyz')>-1 ? 'fengluzhe.xyz': 'fengluzhe.cn',
    // domain: '82.157.148.14',
    ip: '82.157.148.14',
    port: '8088'
  }
}
let originInfo = originConfig[process.env.NODE_ENV]
let host = originInfo.domain ? originInfo.domain : originInfo.ip;
const prefixPath = `${originInfo.protocal}://${host}:${originInfo.port}`
console.log(777,process.env.hostname,prefixPath);

export { prefixPath };
export default originConfig;
