//
//  SurfAlarmAppDelegate.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/11/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import "SurfAlarmAppDelegate.h"
#import "WebViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <Parse/Parse.h>

@implementation SurfAlarmAppDelegate

@synthesize window;
@synthesize userInfo = _userInfo;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"f30kkLGXes5hI8fC1c5HsN1lL5NsgTJafbILJUZL"
                  clientKey:@"TcsVkz6XjJP6UCCzJnLzWR5NaPNBddmvrrJ1GA4c"];
    
    NSLog(@"Registering Remote Notications");
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];

	
    
    // Create the nav controller
	UINavigationController * mainNavController = [[UINavigationController alloc] init];
	mainNavController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0.2 blue:0.4 alpha:0];
	
	// Create the main screen
	MainScreenViewController * mainScreen = [[MainScreenViewController alloc] initWithNibName:@"MainScreen" bundle:[NSBundle mainBundle]];
	[mainNavController pushViewController:mainScreen animated:NO];
    
    self.mainScreen = mainScreen;
	
	// Add the nav controller to the window
	[self.window setRootViewController:mainNavController];
	
	// Display
    [window makeKeyAndVisible];
	
	if (launchOptions != nil) {
        self.userInfo = launchOptions;
		[self handleNotification];
	}
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

// Delegation methods
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    [PFPush storeDeviceToken:devToken]; // Send parse the device token
    // Subscribe this user to the broadcast channel, ""
    [self.mainScreen subscribeChannel];
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    self.userInfo = [NSDictionary dictionaryWithDictionary:userInfo];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Surf Alarm!"
                                                     message:userInfo[@"aps"][@"alert"]
                                                    delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles: nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self handleNotification];
}

- (void) handleNotification
{	
	NSString * urlString = self.userInfo[@"url"];
	NSURL *url = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:url];
}

- (void) playSound 
{
	NSString *newAudioFile = [[NSBundle mainBundle] pathForResource:@"surf_alarm" ofType:@"caf"];
	AVAudioPlayer *av = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:newAudioFile] error:NULL];
	[av play];
}



@end
