//
//  DeviceMotionUpdate.h
//  Timo
//
//  Created by Alexander Fringes on 2/12/14.
//  Copyright (c) 2014 Timo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>

@interface DeviceMotionUpdate : NSObject <CLLocationManagerDelegate>

- (id)init;

- (void)startLocationTracking;
- (void)stopLocationTracking;

- (void)startMotionCollection;

@end
