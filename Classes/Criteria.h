//
//  Criteria.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@interface Criteria : NSObject  {

}

@property (strong) NSDate *  time;
@property (strong) NSString *  location;
@property (strong) NSString *  county;
@property (assign, nonatomic) NSInteger quality;
@property (assign, nonatomic) NSInteger locationId;
@property (assign, nonatomic) NSInteger waveHeight;
@property (assign, nonatomic) BOOL isDirty;

- (id) initWithDefaultValues;
- (void)saveToUser:(PFUser *) user;
- (void)getFromUser:(PFUser *) user;

@end
