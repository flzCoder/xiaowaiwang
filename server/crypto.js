const crypto = require("crypto");
module.exports = {
    md5: (pass, autograph) => {
        const md5 = crypto.createHash("md5");
        md5.update(pass+autograph);
        const result = md5.digest("hex");
        return result;
    },
    encrypt: (data, key) => {
        const cipher = crypto.createCipher('aes192', key);
        let crypted = cipher.update(data, 'utf8', 'hex');
        crypted += cipher.final('hex');
        return crypted;
    },
    decrypt: (encrypted, key) => {
        const decipher = crypto.createDecipher('aes192', key);
        let decrypted = decipher.update(encrypted, 'hex', 'utf8');
        decrypted += decipher.final('utf8');
        return decrypted;
    }
}
