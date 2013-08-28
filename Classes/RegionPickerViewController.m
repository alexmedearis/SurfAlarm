//
//  RegionPickerViewController.m
//  SurfAlarm
//
//  Created by Andy Dufresne on 6/26/13.
//
//

#import "RegionPickerViewController.h"
#import "CountyPickerViewController.h"

@interface RegionPickerViewController ()

@end

@implementation RegionPickerViewController

#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style criteria:(Criteria *)criteria{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
		NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"Locations" ofType:@"plist"];
		self.data = [NSDictionary dictionaryWithContentsOfFile:plistPath];
		self.labels = [self.data allKeys];
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
	[label setText:@"Region"];
	[label setTextAlignment:NSTextAlignmentCenter];
	self.navigationItem.titleView = label;
	self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
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
	}
	else
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
    NSDictionary * counties = self.data[key];
	CountyPickerViewController * countyController = [[CountyPickerViewController alloc] initWithStyle:UITableViewStylePlain
                                                                                             criteria:self.criteria
                                                                                              counties:counties
                                                                                               region:key];
                                                     
                                                        
	[self.navigationController pushViewController:countyController animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
