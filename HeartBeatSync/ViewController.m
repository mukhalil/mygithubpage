//
//  ViewController.m
//  HeartBeatSync
//
//  Created by Muhammad Khalil on 5/16/19.
//  Copyright © 2019 Muhammad Khalil. All rights reserved.
//

#import "ViewController.h"
#import "HeartBeatBubbleView.h"
#import "HeartBeatBufferView.h"

#define PULSE_CYCLE_IN_SECONDS 5
//Note: this is just a starting buffer capacity, it is possible it can grow bigger if needed
#define SUGGESTED_INITIAL_BUFFER_SIZE 10
#define TOP_MARGIN 100
#define CIRCLE_DIAMETER 175.0


@interface ViewController () {
    HeartBeatBubbleView *bubble;
    HeartBeatBufferView *bufferView;
}

@property (strong, nonatomic) HeartBeatServer *server;
@property (strong, nonatomic) HeartBeatManager *manager;
@property (strong, nonatomic) HeartBeatGenerator *generator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[HeartBeatManager alloc] initWithBufferSize:SUGGESTED_INITIAL_BUFFER_SIZE];
    self.server = [[HeartBeatServer alloc] init];
    self.server.vcDelegate = self;
    self.server.delegate = self.manager;
    self.manager.server = self.server;
    self.generator = [[HeartBeatGenerator alloc] initGeneratorWithPulseCycle:PULSE_CYCLE_IN_SECONDS
                                                                    delegate:self.manager
                                                                  vcDelegate:self];

    bubble = [[HeartBeatBubbleView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - CIRCLE_DIAMETER) / 2.0,
                                                                   TOP_MARGIN,
                                                                   CIRCLE_DIAMETER,
                                                                   CIRCLE_DIAMETER)];
    [self.view addSubview:bubble];
    [bubble startAnimation];
    
    bufferView = [[HeartBeatBufferView alloc] initWithFrame:CGRectMake(0,
                                                                       self.view.frame.size.height - 350,
                                                                       self.view.frame.size.width,
                                                                       200)];
    [self.view addSubview:bufferView];
    
    
}

- (void)sendAcknowledgement:(HeartBeatServer *)sender ofReceivedBuffer:(NSMutableArray<HeartBeatObject *> *)beats {
    [bufferView clearBuffer];
}

-(void)beatGenerated:(HeartBeatGenerator *)sender beat:(HeartBeatObject *)beat {
    [bufferView addBeatWithPulse:beat.pulse];
    [bubble updateViewWithPulse:beat.pulse];
}



@end
