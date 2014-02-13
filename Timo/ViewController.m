//
//  ViewController.m
//  Timo
//
//  Created by Alexander Fringes on 2/12/14.
//  Copyright (c) 2014 Timo. All rights reserved.
//

#import "ViewController.h"
#import "DeviceMotionUpdate.h"

@interface ViewController ()

@property (strong, nonatomic) DeviceMotionUpdate *update;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.update = [[DeviceMotionUpdate alloc] init];
    [self.update startLocationTracking];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
