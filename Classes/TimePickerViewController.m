    //
//  TimePickerViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TimePickerViewController.h"


@implementation TimePickerViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil criteria:(Criteria *)_criteria{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		criteria = _criteria;
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set Title and Background
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
	[label setFont:[UIFont fontWithName:@"Marker Felt" size:20.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"Time"];
	[label setTextAlignment:UITextAlignmentCenter];
    NSDate * toSet = [NSDate date];
	if(criteria.time != nil){
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        NSDateComponents *toSetComponents = [gregorian components: NSUIntegerMax fromDate: toSet];
        NSDateComponents *criteriaComponents = [gregorian components: NSUIntegerMax fromDate: criteria.time];

        [toSetComponents setHour: criteriaComponents.hour];
        [toSetComponents setMinute: criteriaComponents.minute];
        
        toSet = [gregorian dateFromComponents: toSetComponents];
    }
    timePicker.date = toSet;
	self.navigationItem.titleView = label;	 
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (IBAction)setTimeClicked:(id)sender {
    criteria.time = timePicker.date;
	criteria.isDirty = YES;
	[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}




@end
