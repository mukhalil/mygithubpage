//
//  HeartBeatGenerator.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeartBeatObject.h"

@class HeartBeatGenerator;

@protocol HeartBeatGeneratorDelegate <NSObject>

@required
- (void)beatGenerated:(HeartBeatGenerator *)sender
                 beat:(HeartBeatObject *)beat;

@end

@interface HeartBeatGenerator : NSObject

@property (nonatomic, assign) NSInteger pulseCycle;
@property (nonatomic, weak) id<HeartBeatGeneratorDelegate> delegate;
@property (nonatomic, weak) id<HeartBeatGeneratorDelegate> viewControllerDelegate;

-(instancetype)initGeneratorWithPulseCycle:(NSInteger)seconds
                                  delegate:(id<HeartBeatGeneratorDelegate>)delegate
                                vcDelegate:(id<HeartBeatGeneratorDelegate>)vcDelegate;

@end

