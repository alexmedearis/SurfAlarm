//
//  CountyPickerViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 Alexander Medearis. All rights reserved.
//

#import "CountyPickerViewController.h"
#import "LocationPickerViewController.h"


@implementation CountyPickerViewController


#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)criteria counties:(NSDictionary *)counties region:(NSString *)region {
    if ((self = [super initWithStyle:style])) {
		self.data = counties;
		self.labels = [counties allKeys];
		self.criteria = criteria;
    }
    return self;
}



#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set Title and Background
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
	[label setFont:[UIFont fontWithName:@"Marker Felt" size:20.0]];
	[label setBackgroundColor:[UIColor clearColor]];
	[label setTextColor:[UIColor whiteColor]];
	[label setTextAlignment:UITextAlignmentCenter];
	self.navigationItem.titleView = label;
	self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    self.title = @"County";
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections -- just one section...
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 0)
	{
		return [self.labels count];
	} else
	{
		return 0;
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [[cell textLabel] setText:self.labels[[indexPath row]]];
	[[cell textLabel] setFont:[UIFont fontWithName:@"Marker Felt" size:20.0]];
	[cell setBackgroundColor:[UIColor grayColor]];
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString * key = self.labels[[indexPath row]];
    NSDictionary * spots = self.data[key];
	LocationPickerViewController * locationController = [[LocationPickerViewController alloc] initWithStyle:UITableViewStylePlain 
																								   criteria:self.criteria
																									  spots:spots
																									 county:key];
	[self.navigationController pushViewController:locationController animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

@end

