//
//  TimePickerViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criteria.h"


@interface TimePickerViewController : UIViewController<UIPickerViewDelegate> {

}

@property (strong) Criteria * criteria;
@property (weak) IBOutlet UIDatePicker * timePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
			 criteria:(Criteria *)criteria;
@end
