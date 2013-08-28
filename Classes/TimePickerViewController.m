//
//  TimePickerViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import "TimePickerViewController.h"


@implementation TimePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil criteria:(Criteria *)criteria{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		self.criteria = criteria;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set Title and Background
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
	[label setFont:[UIFont fontWithName:@"Marker Felt" size:20.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"Time"];
	[label setTextAlignment:NSTextAlignmentCenter];
    NSDate * toSet = [NSDate date];
	if(self.criteria.time != nil){
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        NSDateComponents *toSetComponents = [gregorian components: NSUIntegerMax fromDate: toSet];
        NSDateComponents *criteriaComponents = [gregorian components: NSUIntegerMax fromDate: self.criteria.time];
        
        [toSetComponents setHour: criteriaComponents.hour];
        [toSetComponents setMinute: criteriaComponents.minute];
        
        toSet = [gregorian dateFromComponents: toSetComponents];
    }
    self.timePicker.date = toSet;
	self.navigationItem.titleView = label;
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

- (IBAction)setTimeClicked:(id)sender {
    self.criteria.time = self.timePicker.date;
	self.criteria.isDirty = YES;
	[self.navigationController popToRootViewControllerAnimated:YES];
}

@end
