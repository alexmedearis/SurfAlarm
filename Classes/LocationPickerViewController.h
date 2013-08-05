//
//  LocationPickerViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criteria.h"

@interface LocationPickerViewController : UITableViewController {

}

@property (strong) NSDictionary * spots;
@property (strong) NSArray * labels;
@property (strong) Criteria * criteria;
@property (strong) NSString * county;

- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)criteria spots:(NSDictionary *)spots county:(NSString *)county;

@end
