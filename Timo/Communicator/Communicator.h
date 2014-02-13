//
//  Communicator.h
//  Timo
//
//  Created by Alexander Fringes on 2/13/14.
//  Copyright (c) 2014 Timo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface Communicator : NSObject

- (id)init;

- (void)connect;
- (void)update:(NSString *)driverID withLocation:(CLLocation *)location;

@end
