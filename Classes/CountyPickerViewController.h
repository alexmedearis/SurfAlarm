//
//  CountyPickerViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criteria.h"

@interface CountyPickerViewController : UITableViewController {
	NSDictionary * data;
	NSArray * labels;
	Criteria * criteria;
}

- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)_criteria;


@end
