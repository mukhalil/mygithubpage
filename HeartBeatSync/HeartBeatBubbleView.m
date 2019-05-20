//
//  HeartBeatBubbleView.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/17/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "HeartBeatBubbleView.h"
#import <QuartzCore/QuartzCore.h>

@interface HeartBeatBubbleView ()
@property (nonatomic, weak) CAShapeLayer *pathLayer;
@end

@implementation HeartBeatBubbleView {
    UILabel *label;
    UIView *vibration;
}

- (void)startAnimation
{
    //Setup Label
    label = [[UILabel alloc] initWithFrame:self.bounds];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:60.0 weight:UIFontWeightThin];
    label.textAlignment = NSTextAlignmentCenter;

    //Setup graphics
    vibration = [[UIView alloc] initWithFrame:self.bounds];
    vibration.layer.cornerRadius = vibration.frame.size.width / 2.0;
    vibration.backgroundColor = [UIColor redColor];
    [self addSubview:vibration];
    if (self.pathLayer == nil)
    {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];

        [shapeLayer setPath:[path CGPath]];

        shapeLayer.strokeColor = [[UIColor redColor] CGColor];
        shapeLayer.fillColor = nil;
        shapeLayer.lineWidth = 8.0f;
        shapeLayer.lineJoin = kCALineJoinBevel;

        [self.layer addSublayer:shapeLayer];

        self.pathLayer = shapeLayer;
    }

    CABasicAnimation *fillAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    self.pathLayer.fillColor = UIColor.redColor.CGColor;
    fillAnimation.toValue = (__bridge id _Nullable)([UIColor colorWithRed:0.73 green:0.0 blue:0.0 alpha:1.0].CGColor);
    fillAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    fillAnimation.autoreverses = true;
    fillAnimation.repeatCount = NSIntegerMax;
    fillAnimation.duration = 0.75;
    [self.pathLayer addAnimation:fillAnimation forKey:@"fillColorAnimation"];
    [self addSubview:label];
    
    [UIView animateKeyframesWithDuration:1.50 delay:0.0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        self->vibration.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2.0, 2.0);
        self->vibration.alpha = 0.0;
    } completion:^(BOOL finished) {
        self->vibration.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        self->vibration.alpha = 1.0;
    }];

}

-(void)updateViewWithPulse:(NSInteger)pulse {
    label.text = [NSString stringWithFormat:@"%ld", (long)pulse];
}

@end
