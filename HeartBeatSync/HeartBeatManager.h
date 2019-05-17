//
//  HeartBeatManager.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeartBeatGenerator.h"
#import "HeartBeatServer.h"

@interface HeartBeatManager : NSObject <HeartBeatGeneratorDelegate, HeartBeatServerDelegate>

-(instancetype)initWithBufferSize:(NSInteger)bufferSize;

@end
