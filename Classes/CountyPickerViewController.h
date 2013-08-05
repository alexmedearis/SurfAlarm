//
//  CountyPickerViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criteria.h"

@interface CountyPickerViewController : UITableViewController {
	
}

@property (strong) NSDictionary * data;
@property (strong) NSArray * labels;
@property (strong) Criteria * criteria;

- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)criteria counties:(NSDictionary *)counties region:(NSString *)region;


@end
