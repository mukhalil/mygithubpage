//
//  HeartBeatObject.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "HeartBeatObject.h"

@interface HeartBeatObject()

@property (nonatomic, assign, readwrite) NSInteger beatID;
@property (nonatomic, assign, readwrite) NSInteger pulse;

@end

@implementation HeartBeatObject


-(instancetype)initWithID:(NSInteger)ID pulse:(NSInteger)pulse {
    self = [super init];
    if (self) {
        self.beatID = ID;
        self.pulse = pulse;
    }
    return self;
}

@end
