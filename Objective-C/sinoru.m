//
//  sinoru.m
//  
//
//  Created by Sinoru on 2015. 8. 22..
//  Copyright © 2015년 Sinoru. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSOutputStream *outputStream = [[NSOutputStream alloc] initToFileAtPath:[[[NSFileManager defaultManager] currentDirectoryPath] stringByAppendingPathComponent:@"big"] append:YES];
        if (outputStream != nil) {
            [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            [outputStream open];
            
            NSInteger status = 0;
            NSData *data = [@"\0" dataUsingEncoding:NSUTF8StringEncoding];
            while (status >= 0) {
                status = [outputStream write:data.bytes maxLength:1];
            }
        }
    }
    return 0;
}
