//
//  ViewController.h
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeartBeatGenerator.h"
#import "HeartBeatManager.h"
#import "HeartBeatServer.h"

@interface ViewController : UIViewController <HeartBeatGeneratorDelegate, HeartBeatServerDelegate>

@end

