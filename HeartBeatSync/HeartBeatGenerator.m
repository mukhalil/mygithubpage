//
//  HeartBeatGenerator.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeartBeatGenerator.h"

@implementation HeartBeatGenerator {
    NSInteger curID;
}

-(instancetype)initGeneratorWithPulseCycle:(NSInteger)seconds
                                  delegate:(id<HeartBeatGeneratorDelegate>)delegate
                                vcDelegate:(id<HeartBeatGeneratorDelegate>)vcDelegate {
    self = [super init];
    if (self) {
        self.pulseCycle = seconds;
        self.delegate = delegate;
        self.viewControllerDelegate = vcDelegate;
        curID = 0;
        [self initiateTimer];
    }
    return self;
}

-(void)initiateTimer {
    NSTimer* timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:self.pulseCycle
                                             target:self
                                           selector:@selector(generateBeat)
                                           userInfo:nil
                                            repeats:YES];
}

-(void)generateBeat {
    //Assuming a beat is regular, so within 50-80 pulse range.
    NSInteger beat = 50 + arc4random() % 31;
    HeartBeatObject *beatObj = [[HeartBeatObject alloc] initWithID:curID pulse:beat];
    [self.delegate beatGenerated:self beat:beatObj];
    [self.viewControllerDelegate beatGenerated:self beat:beatObj];

    curID++;
}

@end
