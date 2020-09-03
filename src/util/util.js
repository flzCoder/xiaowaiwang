let util = {
    formatDate(date, fmt) {
        if (date.toString().indexOf('0000') > -1 || !!!date.getTime()) {
            return 'Invalid Date';
        }
        date = date || new Date();
        fmt = fmt || 'yyyy-MM-dd hh:mm:ss';
        if (!(typeof date === 'object' && date.getFullYear)) {
            return date;
        }

        let year = date.getFullYear();
        let month = date.getMonth() + 1;
        let da = date.getDate();
        let hour = date.getHours();
        let minu = date.getMinutes();
        let sec = date.getSeconds();
        fmt = fmt.replace('yyyy', year);
        fmt = fmt.replace('MM', month.toString().length < 2 ? '0' + month : month);
        fmt = fmt.replace('dd', da.toString().length < 2 ? '0' + da : da);
        fmt = fmt.replace('hh', hour.toString().length < 2 ? '0' + hour : hour);
        fmt = fmt.replace('mm', minu.toString().length < 2 ? '0' + minu : minu);
        fmt = fmt.replace('ss', sec.toString().length < 2 ? '0' + sec : sec);
        return fmt;
    }
};

export default util;
