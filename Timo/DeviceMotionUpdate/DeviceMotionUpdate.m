//
//  DeviceMotionUpdate.m
//  Timo
//
//  Created by Alexander Fringes on 2/12/14.
//  Copyright (c) 2014 Timo. All rights reserved.
//

#import "DeviceMotionUpdate.h"
#import "Communicator.h"

@interface DeviceMotionUpdate()

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) Communicator *communicator;
@property (strong, nonatomic) NSString *driverID;

@end


@implementation DeviceMotionUpdate

- (id)init {
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.pausesLocationUpdatesAutomatically = NO;
        self.communicator = [[Communicator alloc] init];
        self.driverID = @"1";
        [self.communicator connect];
    }
    return self;
}

- (CMMotionManager *)motionManager
{
    CMMotionManager *motionManager = nil;
    id appDelegate = [UIApplication sharedApplication].delegate;
    
    if ([appDelegate respondsToSelector:@selector(motionManager)]) {
        motionManager = [appDelegate motionManager];
    }
    return motionManager;
}

- (void)startMyMotionDetect
{
	[self.motionManager
	 startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
	 withHandler:^(CMAccelerometerData *data, NSError *error)
	 {
		 dispatch_async(dispatch_get_main_queue(),
        ^{
            NSLog(@"x: %f",data.acceleration.x);
            NSNumber *myDoubleNumber = [NSNumber numberWithDouble:data.acceleration.x];
//         [self.label setText:[myDoubleNumber stringValue]];
        }
        );
	 }
	 ];
}

- (void)startLocationTracking {
    [self.locationManager startUpdatingLocation];
}

- (void)stopLocationTracking {
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    NSLog(@"x: %@",location);
    [self.communicator update:self.driverID withLocation:location];
}

@end
