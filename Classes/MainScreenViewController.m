    //
//  MainScreenViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import <Parse/Parse.h>
#import "MainScreenViewController.h"
#import "TimePickerViewController.h"
#import "RegionPickerViewController.h"
#import "UIColor+FlatUI.h"
#import "UIColor+AppColors.h"
#import "UINavigationBar+FlatUI.h"	
#import <FlatUIKit/UIBarButtonItem+FlatUI.h>

@interface MainScreenViewController (PrivateMethods)

@end

@implementation MainScreenViewController

@synthesize user = _user;
@synthesize HUD = _HUD;
@synthesize criteria = _criteria;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.title = @"Home";
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
    
	// Set custom image to nav bar
	self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerlogo"]];
    self.navigationController.navigationBar.translucent = NO;
	
	// Set backround
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    // The hud will dispable all input on the view (use the higest view possible in the view hierarchy)
    MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	
    // Add HUD to screen
    [self.navigationController.view addSubview:HUD];
	
    // Regisete for HUD callbacks so we can remove it from the window at the right time
    HUD.delegate = self;
    HUD.labelText = @"Loading";
    self.HUD = HUD;
    
    [self setupColors];
    
    [self loadUser];
}

- (void)setupColors {
    // iOS 6 / 7 tint color switch
    if([self.navigationController.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        self.navigationController.navigationBar.barTintColor = [UIColor turquoiseColor];
    } else {
        self.navigationController.navigationBar.tintColor = [UIColor turquoiseColor];
    }
    
    [self.waveHeightSlider configureFlatSliderWithTrackColor:[UIColor fadedColor]
                                               progressColor:[UIColor turquoiseColor]
                                                  thumbColor:[UIColor turquoiseShadowColor]];

    
    self.cancelButton.buttonColor = [UIColor cancelRedColor];
    self.cancelButton.shadowColor = [UIColor redShadowColor];
    
    self.conditionsSelector.cornerRadius = 5.0;
    self.conditionsSelector.selectedColor = [UIColor turquoiseColor];
    self.conditionsSelector.deselectedColor = [UIColor fadedColor];
    self.conditionsSelector.dividerColor = [UIColor grayColor];
    self.conditionsSelector.selectedFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0];
    self.conditionsSelector.deselectedFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0];
    self.conditionsSelector.selectedFontColor = [UIColor whiteColor];
    self.conditionsSelector.deselectedFontColor = [UIColor darkGrayColor];
}

- (void)viewWillAppear:(BOOL)animated {
    UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    if (!(types & UIRemoteNotificationTypeAlert)) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                   message:@"This application utilizes push notifications to send surf alerts.  Please verify that you have enabled push notifications for this application and try again."
                                  delegate:self
                         cancelButtonTitle:@"OK"
                         otherButtonTitles: nil];
        [alert show];
    }
	[self updateUI];
}

- (void) updateUI {
	
    // Time (can be nil if not set)
    if(self.criteria.time != 0){
		NSDateFormatter * time = [[NSDateFormatter alloc] init];
		[time setDateFormat:@"h:mm a"];
		NSString * strdate = [[NSString alloc] initWithFormat:@"%@",[time stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.criteria.time]]];
		[self.timeButton setTitle:strdate forState:UIControlStateNormal];
	} else {
		[self.timeButton setTitle:@"Not Set" forState:UIControlStateNormal];
	}
    
    // Place
    if(self.criteria.name != nil){
        [self.placeButton setTitle:[NSString stringWithFormat:@"%@", self.criteria.name] forState:UIControlStateNormal];
    } else{
        [self.placeButton setTitle:@"Not Set" forState:UIControlStateNormal];
    }
	
    // Conditions
    if([self.conditionsSelector selectedSegmentIndex] != self.criteria.quality) {
        [self.conditionsSelector setSelectedSegmentIndex:self.criteria.quality];        
    }
    
    // Wave Height
    if(self.waveHeightSlider.value != self.criteria.waveHeight) {
        self.waveHeightSlider.value = self.criteria.waveHeight;
    }
    self.waveFtLabel.text = [NSString stringWithFormat:@"%d ft.+", self.criteria.waveHeight];

	// Dirty
	if(self.criteria.isDirty){
		[self.dirtyIndicatorLabel setHidden:NO];
	} else {
		[self.dirtyIndicatorLabel setHidden:YES];		
	}
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (IBAction) timeClicked: (id)sender
{
	TimePickerViewController * timePicker = [[TimePickerViewController alloc] initWithNibName:@"TimePicker" bundle:[NSBundle mainBundle]
																					 criteria:self.criteria];	
	[self.navigationController pushViewController:timePicker animated:YES];
}


- (IBAction) locationClicked: (id)sender
{
	RegionPickerViewController * regionController = [[RegionPickerViewController alloc] initWithStyle:UITableViewStylePlain criteria:self.criteria]; // Other option is UITableViewStyleGrouped
    
	[self.navigationController pushViewController:regionController animated:YES];
}

- (IBAction) criteriaChanged: (id)sender{
	int index = [self.conditionsSelector selectedSegmentIndex];
	if(index != self.criteria.quality) {
		self.criteria.quality = index;
		self.criteria.isDirty = YES;
	}
	[self updateUI];
}

- (IBAction)waveHeightChanged:(id)sender {
    int waveHeight = (int) self.waveHeightSlider.value;
    if(waveHeight != self.criteria.waveHeight) {
        self.criteria.waveHeight = (int) self.waveHeightSlider.value;
		self.criteria.isDirty = YES;
	}
    [self updateUI];

}


- (void)doSave {
    [self.HUD show:YES];
 	[self.criteria saveToUser:self.user];
    [self.user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self.HUD hide:YES];
        if(succeeded) {
            self.criteria.isDirty = NO;
            [self updateUI];
            [self updateCriteriaString];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Whoops!" message:@"Something went wrong saving your alarm.  Please try again later."
                                                           delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        }
    }];
}

- (IBAction) saveClicked: (id)sender{
    [self doSave];
}

- (IBAction)cancelClicked:(id)sender {
    self.criteria.time = 0;
	self.criteria.isDirty = YES;
    [self updateUI];
    [self doSave];
}

- (void)updateCriteriaString{
    NSString *criteriaString;
    if(self.criteria.time == 0) {
		criteriaString = @"Not Set";
	} else {
		// Display the saved alarm in the title bar
		NSDateFormatter * time = [[NSDateFormatter alloc] init];
		[time setDateFormat:@"h:mm a"];
		NSString * strdate = [[NSString alloc] initWithFormat:@"%@",[time stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.criteria.time]]];
		criteriaString = [NSString stringWithFormat:@"%@ - %@ - %@ - %dft+", strdate, self.criteria.name, [self stringFromQuality:self.criteria.quality], self.criteria.waveHeight];
	}
    [self.alarmIndicatorLabel setText:criteriaString];
}

- (NSString *) stringFromQuality: (int)quality
{
	switch (quality) {
		case 0:
			return @"Poor";
			break;
		case 1:
			return @"Poor-Fair";
			break;
		case 2:
			return @"Fair";
			break;
		case 3:
			return @"Fair-Good";
			break;
		case 4:
			return @"Good";
			break;
		default:
			return @"Poor";
			break;
	}
}

-(void)subscribeChannel {
    if(self.user && [PFInstallation currentInstallation].deviceToken){
        [[PFInstallation currentInstallation] addUniqueObject:[NSString stringWithFormat:@"user_%@", self.user.username] forKey:@"channels"];
        [[PFInstallation currentInstallation] saveEventually];
    }
}

-(void) loadCriteria {
    [self subscribeChannel];
    self.criteria = [[Criteria alloc] initWithDefaultValues];
    if(self.user[@"time"]){
        [self.criteria getFromUser:self.user];
    }
    [self updateUI];
    [self updateCriteriaString];
}

-(void) loadUser {
    // Only load criteria if we dont already have it...
    if([PFUser currentUser]) {
        self.user = [PFUser currentUser];
        [self loadCriteria];
        NSLog(@"Saved User");
    } else {
        [self.HUD show:YES];
        [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"Unable to connect with server.  Check your connection and try again later."
                                                               delegate:^(UIAlertView * alertView, NSInteger buttonIndex)
                                                                {
                                                                    exit(0);
                                                                }
                                                                cancelButtonTitle:@"OK" 
                                                                otherButtonTitles: nil];
                [alert show];
                NSLog(@"Anonymous login failed.");
            } else {
                self.user = user;
                [self.HUD hide:YES];
                [self loadCriteria];
                NSLog(@"Anonymous user logged in.");
            }
        }];
    }
}

// Delegate method for HUD
- (void)hudWasHidden {}


@end
