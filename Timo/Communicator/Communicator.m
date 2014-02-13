//
//  Communicator.m
//  Timo
//
//  Created by Alexander Fringes on 2/13/14.
//  Copyright (c) 2014 Timo. All rights reserved.
//

#import "Communicator.h"
#import "SRWebSocket.h"
#import "SocketIO.h"

@interface Communicator()

@property (strong, nonatomic) SocketIO *socketIO;

@end

@implementation Communicator

-(id)init {
    self = [super init];
    if (self) {
        self.socketIO = [[SocketIO alloc] initWithDelegate:self];
    }
    return self;
}

-(void)connect {
    [self.socketIO connectToHost:@"printf.net" onPort:8001];
    
    NSMutableDictionary *driver = [NSMutableDictionary dictionary];
    [driver setObject:@"1" forKey:@"driver_id"];
    
    [self.socketIO sendEvent:@"register driver" withData:driver];
}

- (void)update:(NSString *)driverid withLocation:(CLLocation *)location andMotion:(NSString *)motion {
    
    NSMutableDictionary *coordinates = [NSMutableDictionary dictionary];
    [coordinates setObject:motion forKey:@"latitude"];
    
    NSMutableDictionary *payload = [NSMutableDictionary dictionary];
    [payload setObject:coordinates forKey:@"coordinates"];
    [payload setObject:@"1" forKey:@"driver_id"];
    
    [self.socketIO sendEvent:@"update driver location" withData:payload];
}

@end
