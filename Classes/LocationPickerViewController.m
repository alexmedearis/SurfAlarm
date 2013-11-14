//
//  LocationPickerViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import "LocationPickerViewController.h"

enum {
    InstructorsGroup = 0,
    TeachingAssistantsGroup,
    GuestLecturersGroup
};


@implementation LocationPickerViewController


#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)criteria spots:(NSDictionary *)spots county:(NSString *)county {
    if ((self = [super initWithStyle:style])) {
		self.spots = spots;
		self.criteria = criteria;
		self.labels = [self.spots allKeys];
		self.county = county;
	}
    return self;
}



#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set Title and Background
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
	[label setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setText:@"Location"];
	[label setTextAlignment:NSTextAlignmentCenter];
	self.navigationItem.titleView = label;
	self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];	
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 0){
		return [self.spots count];
	} else {
		return 0;
	}
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell2";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [[cell textLabel] setText:self.labels[[indexPath row]]];
	[[cell textLabel] setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20.0]];
	[cell setBackgroundColor:[UIColor clearColor    ]];
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * key = self.labels[[indexPath row]];
	self.criteria.name = key;
    NSArray * spotData = self.spots[key];
	self.criteria.locationId = [spotData[0] integerValue];
	self.criteria.url = spotData[1];
	self.criteria.isDirty = YES;
	[self.navigationController popToRootViewControllerAnimated:YES];
}

@end

