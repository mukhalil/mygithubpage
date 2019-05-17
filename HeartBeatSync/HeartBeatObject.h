//
//  HeartBeatObject.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeartBeatObject : NSObject

@property (nonatomic, assign, readonly) NSInteger beatID;
@property (nonatomic, assign, readonly) NSInteger pulse;

-(instancetype)initWithID:(NSInteger)ID
                    pulse:(NSInteger)pulse;

@end
