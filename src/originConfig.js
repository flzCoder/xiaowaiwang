let originConfig = {
  development: {
    protocal: 'http',
    domain: 'flz.mudan.com',
    ip: '127.0.0.1',
    port: '8088'
  },
  production: {
    protocal: 'http',
    domain: 'fengluzhe.cn',
    ip: '82.157.148.14',
    port: '8088'
  }
}
let originInfo = originConfig[process.env.NODE_ENV]
let host = originInfo.domain ? originInfo.domain : originInfo.ip;
let prefixPath = `${originInfo.protocal}://${host}:${originInfo.port}`
console.log(777,process.env.hostname,prefixPath);

export { prefixPath };
export default originConfig;
