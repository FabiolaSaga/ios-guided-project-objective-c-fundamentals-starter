//
//  LSIPersonSearchTableViewController.m
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIPersonSearchTableViewController.h"
#import "LSIPersonTableViewCell.h"
#import "LSIPersonController.h"

@interface LSIPersonSearchTableViewController ()

@property LSIPersonController *controller;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation LSIPersonSearchTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		_controller = [[LSIPersonController alloc] init];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
	
//	// Class type
//	NSDictionary *dictionary = @{ @"name" : @"Paul" };
//	NSArray *array = @[ @"Blue", @"Green", @"Orange"];
//	
//	NSLog(@"Dictionary: is it a Dictionary? %d", [dictionary isKindOfClass:[NSDictionary class]]);
//	NSLog(@"Dictionary: is it a String? %d", [dictionary isKindOfClass:[NSString class]]);
//	NSLog(@"Array: is it a Dictionary? %d", [array isKindOfClass:[NSDictionary class]]);
//	NSLog(@"Array: is it a Array? %d", [array isKindOfClass:[NSArray class]]);
//	
//	NSObject *object = array;
//	
//	// JSON -> (Array or Dictionary)
//	NSLog(@"object: is it a Dictionary? %d", [object isKindOfClass:[NSDictionary class]]);
//	NSLog(@"object: is it a Array? %d", [object isKindOfClass:[NSArray class]]);

	
	
	// Sanity check
	[self.controller searchForPeopleWithSearchTerm:@"Skywalker" completion:^(NSArray *people, NSError *error) {
		NSLog(@"Completion");
		
		if (error) {
			NSLog(@"Error: %@", error);
			return;
		}
		
		NSLog(@"Search result: %@", people);
		
	}];
	
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	
	// TODO: Search for people and update UI async on main thread
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

	// TODO: Return the number of people in the search results
	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSIPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];

	// TODO: Update the cell with the current person
    return cell;
}

@end
