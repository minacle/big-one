//
//  sinoru.swift
//  
//
//  Created by Sinoru on 2015. 8. 16..
//
//

import Foundation

if let outputStream = NSOutputStream(toFileAtPath: (NSFileManager.defaultManager().currentDirectoryPath as NSString).stringByAppendingPathComponent("big"), append: true) {
    outputStream.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
    outputStream.open()
    
    var status = 0
    let data = "\0".dataUsingEncoding(NSUTF8StringEncoding)!
    while (status >= 0) {
        status = outputStream.write(UnsafePointer<UInt8>(data.bytes), maxLength: 1)
    }    
}
