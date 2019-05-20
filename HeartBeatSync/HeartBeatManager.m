//
//  HeartBeatManager.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "HeartBeatManager.h"

@implementation HeartBeatManager {
    NSMutableArray<HeartBeatObject *> *buffer;
}

-(instancetype)initWithBufferSize:(NSInteger)bufferSize {
    self = [super init];
    if (self) {
        buffer = [[NSMutableArray alloc] initWithCapacity:bufferSize];
    }
    return self;
}

-(void)beatGenerated:(HeartBeatGenerator *)sender beat:(HeartBeatObject *)beat {
    [buffer addObject:beat];
    NSLog(@"%d: %d, buffer size = %d", beat.beatID, beat.pulse, buffer.count);
    [self sendBufferToServer];
}

-(void)sendAcknowledgement:(HeartBeatServer *)sender ofReceivedBuffer:(NSMutableArray<HeartBeatObject *> *)beats {
    //Server successfully recorded given beat
    //Copying beats array since we're using mutable array and want to avoid concurrently modifying the array
    for (HeartBeatObject *obj in [beats copy]) {
        [buffer removeObject:obj];
    }
}

// I chose to design the buffer such that we are sending all data points that have not yet been acknowledged by the
// server. Another assumption is that I am initiating network requests as soon as new heart beats are generated.
// This has the dependency that the generator will run without interruptions, this was to make the design more simple.
-(void)sendBufferToServer {
    //Send buffer to server
    if (buffer.count > 0) {
        [self.server sendBuffer:buffer];
    }
}

@end
