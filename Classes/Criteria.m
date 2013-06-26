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


- (id) initWithDefaultValues {
	if (self = [super init]) {
		self.time = nil;
		self.name = @"Steamer Lane";
		self.url = @"/Steamer-Lane-Surf-Report/163/";
		self.quality = 0;
		self.locationId = 163;
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
    user[@"name"] = self.name;
    user[@"url"] = self.url;
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
    self.name = user[@"name"];
    self.url = user[@"url"];
    self.quality = [user[@"quality"] integerValue];
    self.locationId = [user[@"locationId"] integerValue];
    self.waveHeight = [user[@"waveHeight"] integerValue];
    self.isDirty = NO;
}

@end
