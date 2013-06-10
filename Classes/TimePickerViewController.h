//
//  TimePickerViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Criteria.h"


@interface TimePickerViewController : UIViewController<UIPickerViewDelegate> {
	Criteria * criteria;
	IBOutlet UIDatePicker * timePicker;
	IBOutlet UIButton * alarmOff;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil 
			 criteria:(Criteria *)_criteria;

- (IBAction) dateChanged: (id)sender;
- (IBAction) alarmOffClicked: (id)sender;
@end
