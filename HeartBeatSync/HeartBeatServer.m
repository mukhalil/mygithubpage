//
//  HeartBeatServer.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "HeartBeatServer.h"

@implementation HeartBeatServer

-(void)sendBuffer:(NSMutableArray<HeartBeatObject *> *)buffer {
    //Receiving beat
    //Generate 0 or 1
    NSUInteger randomBool = arc4random_uniform(2);
    if (randomBool == 1) {
        //Simulating network request delay of 1 second
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            NSLog(@"Network Response received!");
            [self.delegate sendAcknowledgement:self ofReceivedBuffer:buffer];
            [self.vcDelegate sendAcknowledgement:self ofReceivedBuffer:buffer];
        });
    }
}

@end
