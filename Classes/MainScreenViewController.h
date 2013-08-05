//
//  MainScreenViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Criteria.h"
#import "MBProgressHUD.h"
#import "UISlider+FlatUI.h"
#import "FUIButton.h"


@interface MainScreenViewController : UIViewController <MBProgressHUDDelegate>{

}

@property (weak) IBOutlet UIButton * timeButton;
@property (weak) IBOutlet UIButton * placeButton;
@property (weak) IBOutlet UISegmentedControl * conditionsSelector;
@property (weak) IBOutlet UIButton * saveButton;
@property (weak) IBOutlet UILabel * alarmIndicatorLabel;
@property (weak) IBOutlet UILabel * dirtyIndicatorLabel;
@property (weak) IBOutlet UISlider *waveHeightSlider;
@property (weak) IBOutlet UILabel *waveFtLabel;
@property (weak) IBOutlet FUIButton *cancelButton;

@property (strong) 	Criteria *criteria;
@property (strong) 	MBProgressHUD *HUD;
@property (strong) PFUser * user;


- (IBAction) timeClicked: (id)sender;
- (IBAction) locationClicked: (id)sender;
- (IBAction) criteriaChanged: (id)sender;
- (IBAction) saveClicked: (id)sender;
- (IBAction) waveHeightChanged:(id)sender;
- (void) updateUI;
- (NSString *) stringFromQuality: (int)quality;
- (void)subscribeChannel;




@end
