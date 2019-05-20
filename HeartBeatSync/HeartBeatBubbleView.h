//
//  HeartBeatBubbleView.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/17/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeartBeatBubbleView : UIView

-(void)startAnimation;

-(void)updateViewWithPulse:(NSInteger)pulse;

@end
