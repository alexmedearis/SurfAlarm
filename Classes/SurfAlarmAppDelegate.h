//
//  SurfAlarmAppDelegate.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainScreenViewController.h"

@interface SurfAlarmAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate> {
    UIWindow * window;
	UINavigationController * mainNavController;
	MainScreenViewController * mainScreen;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (strong) NSDictionary * userInfo;

- (void) playSound;
- (void) handleNotification;

@end

