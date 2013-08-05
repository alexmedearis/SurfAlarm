//
//  WebViewController.h
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/21/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController {

}

@property (weak) IBOutlet UIWebView * webView;
@property (strong) NSString * site;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil site:(NSString *)_site;

@end
