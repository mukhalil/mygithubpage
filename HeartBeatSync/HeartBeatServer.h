//
//  HeartBeatServer.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeartBeatObject.h"

@class HeartBeatServer;

@protocol HeartBeatServerDelegate <NSObject>

@required
- (void)sendAcknowledgement:(HeartBeatServer *)sender
           ofReceivedBuffer:(NSMutableArray<HeartBeatObject *> *)beats;

@end

@interface HeartBeatServer : NSObject

@property (nonatomic, weak) id<HeartBeatServerDelegate> delegate;
@property (nonatomic, weak) id<HeartBeatServerDelegate> vcDelegate;

-(void)sendBuffer:(NSMutableArray<HeartBeatObject *> *)buffer;

@end
