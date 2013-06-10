//
//  LocationPickerViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criteria.h"

@interface LocationPickerViewController : UITableViewController {
	NSDictionary * spots;
	NSArray * labels;
	Criteria * criteria;
	NSString * county;
}

- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)_criteria spots:(NSDictionary *)_spots county:(NSString *)_county;

@end
