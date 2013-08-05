    //
//  WebViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/21/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil site:(NSString *)site {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.site = site;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//Create a URL object.
	NSURL *url = [NSURL URLWithString:self.site];
	
	//URL Requst Object
	NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
	
	//Load the request in the UIWebView.
	[self.webView loadRequest:requestObj];
}



@end
