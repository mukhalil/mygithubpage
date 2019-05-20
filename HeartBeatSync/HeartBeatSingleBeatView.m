//
//  HeartBeatSingleBeatView.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/20/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "HeartBeatSingleBeatView.h"

@implementation HeartBeatSingleBeatView {
    UIImageView *image;
    UILabel *label;
}

-(instancetype)initWithFrame:(CGRect)frame pulse:(NSInteger)pulse {
    self = [super initWithFrame:frame];
    if (self) {
        image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart.png"]];
        image.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:image];
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.text = [NSString stringWithFormat:@"%ld", (long)pulse];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}

-(void)layoutSubviews {
    CGRect labelRect = CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 40);
    label.frame = labelRect;
    CGRect imageRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - 40);
    image.frame = imageRect;
}

@end
