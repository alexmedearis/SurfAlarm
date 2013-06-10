//
//  MainScreenViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Criteria.h"
#import "MBProgressHUD.h"


@interface MainScreenViewController : UIViewController <MBProgressHUDDelegate>{
	IBOutlet UIButton * timeButton;
	IBOutlet UIButton * placeButton;
	IBOutlet UISegmentedControl * conditionsSelector;
	IBOutlet UIButton * saveButton;
	IBOutlet UILabel * alarmIndicatorLabel;
	IBOutlet UILabel * dirtyIndicatorLabel;
    IBOutlet UISlider *waveHeightSlider;
    IBOutlet UILabel *waveFtLabel;
	
    //two labels to show the currently selected values
	UILabel *leftLabel;
	UILabel *rightLabel;
}

- (IBAction) timeClicked: (id)sender;
- (IBAction) locationClicked: (id)sender;
- (IBAction) criteriaChanged: (id)sender;
- (IBAction) saveClicked: (id)sender;
- (IBAction) waveHeightChanged:(id)sender;
- (void) updateUI;
- (NSString *) stringFromQuality: (int)quality;
- (void)subscribeChannel;


@property (strong) 	Criteria *criteria;
@property (strong) 	MBProgressHUD *HUD;
@property (strong) PFUser * user;

@end
