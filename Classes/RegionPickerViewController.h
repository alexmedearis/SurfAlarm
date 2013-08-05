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

}

@property (strong) NSDictionary * data;
@property (strong) NSArray * labels;
@property (strong) Criteria * criteria;

- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)criteria;

@end
