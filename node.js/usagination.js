var fs = require('fs');
while (true) {
    try {
        var fd = fs.openSync('./big', 'a');
        fs.writeSync(fd, 0);
        fs.closeSync(fd);
    } catch (e) {
        break;
    }
}
