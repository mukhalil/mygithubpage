//
//  HeartBeatBufferView.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/18/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "HeartBeatBufferView.h"
#import "HeartBeatSingleBeatView.h"

#define INITIAL_CAPACITY 4


@implementation HeartBeatBufferView {
    NSMutableArray<HeartBeatSingleBeatView *> *pulseViews;
}

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        pulseViews = [[NSMutableArray alloc] initWithCapacity:INITIAL_CAPACITY];
    }
    return self;
}

-(void)addBeatWithPulse:(NSInteger)pulse {
    CGRect rect = CGRectMake(0, 0, 100, 100);
    HeartBeatSingleBeatView *beatView = [[HeartBeatSingleBeatView alloc] initWithFrame:rect pulse:pulse];
    [self addSubview:beatView];
    [pulseViews addObject:beatView];
    [self setNeedsLayout];
}

-(void)layoutSubviews {
    // Assuming max of 9 consecutively failed network calls.
    CGFloat originY = 0;
    CGFloat viewWidth = 100;
    for (int i = 0; i < pulseViews.count; i++) {
        CGFloat originX;
        int mod3 = i % 3;
        NSInteger countMod = ((pulseViews.count - 1) % 3);
        //Accounting for the last unfinished row (less than 3 beats)
        if ((pulseViews.count > 3 && i < 3) || (pulseViews.count > 6 && i < 6)) {
            countMod = 2;
        }

        //Layout cases depending on number of beats to show.
        switch (mod3) {
            case 0:
                originX = ((self.frame.size.width / 2)  - (viewWidth) / 2) - (countMod * viewWidth / 2);
                break;
            case 1:
                originX = ((self.frame.size.width / 2) - (viewWidth) / 2) + (countMod * viewWidth / 2);
                if (countMod == 2) {
                    originX = (self.frame.size.width / 2)  - (viewWidth / 2);
                }
                break;
            case 2:
                originX = ((self.frame.size.width / 2) - (viewWidth) / 2) + (countMod * viewWidth / 2);
                break;
            default:
                originX = 0;
                break;
        }
        //Indenting to next lines when a line of 3 is complete.
        if(i > 2) {
            originY = 120;
        }
        if(i > 5) {
            originY = 240;
        }
        
        //The if statement in these blocks is to avoid awkward animations of the newly created beat view.
        [UIView animateWithDuration:0.5 animations:^{
            if(i != self->pulseViews.count - 1) {
                [self->pulseViews objectAtIndex:i].frame = CGRectMake(originX, originY, viewWidth, 100);
            }
        } completion:^(BOOL finished) {
            if(i == self->pulseViews.count - 1) {
                [self->pulseViews objectAtIndex:i].frame = CGRectMake(originX, originY, viewWidth, 100);
            }
        }];
    }
}

-(void)clearBuffer {
    for(HeartBeatSingleBeatView *views in pulseViews) {
        [UIView animateWithDuration:2.0 animations:^{
            views.alpha = 0.0;
        } completion:^(BOOL finished) {
            [views removeFromSuperview];
            [self->pulseViews removeObject:views];
        }];
    }
    
}

@end
