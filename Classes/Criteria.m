//
//  Criteria.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Criteria.h"
#import <Parse/Parse.h>


@implementation Criteria

@synthesize time = _time;
@synthesize location = _location;
@synthesize county = _county;
@synthesize quality = _quality;
@synthesize locationId = _locationId;
@synthesize isDirty = _isDirty;
@synthesize waveHeight = _waveHeight;

- (id) initWithDefaultValues {
	if (self = [super init]) {
		self.time = nil;
		self.location = @"Cowells";
		self.county = @"Santa Cruz";
		self.quality = 0;
		self.locationId = 3;
        self.waveHeight = 1;
		self.isDirty = YES;
    }
    return self;
}

- (void)saveToUser:(PFUser *) user{
    if(self.time != nil){
        user[@"time"] = self.time;
    } else {
        user[@"time"] = [NSNull null];
    }
    user[@"location"] = self.location;
    user[@"county"] = self.county;
    user[@"quality"] = @(self.quality);
    user[@"locationId"] = @(self.locationId);
    user[@"waveHeight"] = @(self.waveHeight);
}

- (void)getFromUser:(PFUser *) user{
    if(user[@"time"] == [NSNull null]){
        self.time = nil;
    } else {
        self.time = user[@"time"];
    }
    self.location = user[@"location"];
    self.county = user[@"county"];
    self.quality = [user[@"quality"] integerValue];
    self.locationId = [user[@"locationId"] integerValue];
    self.waveHeight = [user[@"waveHeight"] integerValue];
    self.isDirty = NO;
}

@end
