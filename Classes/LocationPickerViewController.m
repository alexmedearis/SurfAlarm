//
//  LocationPickerViewController.m
//  SurfAlarm
//
//  Created by Alexander Medearis on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
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


- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)_criteria spots:(NSDictionary *)_spots county:(NSString *)_county {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
		spots = _spots;
		criteria = _criteria;
		labels = [spots allKeys];
		county = _county;
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
	[label setText:@"Location"];
	[label setTextAlignment:UITextAlignmentCenter];
	self.navigationItem.titleView = label;
	self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];	
}
/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 0){
		return [spots count];
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
    [[cell textLabel] setText:labels[[indexPath row]]];
	[[cell textLabel] setFont:[UIFont fontWithName:@"Marker Felt" size:20.0]];
	[cell setBackgroundColor:[UIColor grayColor]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * key = labels[[indexPath row]];
	criteria.name = key;
    NSArray * spotData = spots[key];
	criteria.locationId = [spotData[0] integerValue];
	criteria.url = spotData[1];
	criteria.isDirty = YES;
	[self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}




@end

