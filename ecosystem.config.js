module.exports = {
  apps : [{
    name: "mudan",
    script: "./index.js",
    env: {
      NODE_ENV: "development",
    },
    env_prod: {
      NODE_ENV: "production",
    }
  }]
}
