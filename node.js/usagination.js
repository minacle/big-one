var fs = require('fs');
var fd = fs.openSync('./big', 'a');
try {
	while (true)
		fs.writeSync(fd, '\0');
} catch (e) {
}

fs.closeSync(fd);
