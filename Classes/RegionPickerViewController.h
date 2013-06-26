//
//  RegionPickerViewController.h
//  SurfAlarm
//
//  Created by Andy Dufresne on 6/26/13.
//
//

#import <UIKit/UIKit.h>
#import "Criteria.h"

@interface RegionPickerViewController : UITableViewController {
 	NSDictionary * data;
	NSArray * labels;
	Criteria * criteria;
}

- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)_criteria;

@end
