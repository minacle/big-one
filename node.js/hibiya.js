#!/usr/bin/env node
"use strict"

let fs = require('fs')

var bigStream = fs.createWriteStream('./big')
var nullStream = fs.createReadStream('/dev/zero')

nullStream.pipe(bigStream)
