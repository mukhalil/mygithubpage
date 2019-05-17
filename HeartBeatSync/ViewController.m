//
//  ViewController.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "ViewController.h"

#define PULSE_CYCLE_IN_SECONDS 5
//Note: this is just a starting buffer capacity, it is possible it can grow bigger if needed
#define SUGGESTED_INITIAL_BUFFER_SIZE 10


@interface ViewController ()

@property (strong, nonatomic) HeartBeatManager *manager;
@property (strong, nonatomic) HeartBeatGenerator *generator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[HeartBeatManager alloc] initWithBufferSize:SUGGESTED_INITIAL_BUFFER_SIZE];
    self.generator = [[HeartBeatGenerator alloc] initGeneratorWithPulseCycle:PULSE_CYCLE_IN_SECONDS
                                                                    delegate:self.manager];
}


@end
