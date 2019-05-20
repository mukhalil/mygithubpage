//
//  HeartBeatBufferView.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/18/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeartBeatBufferView : UIView

-(void)addBeatWithPulse:(NSInteger)pulse;
-(void)clearBuffer;

@end
