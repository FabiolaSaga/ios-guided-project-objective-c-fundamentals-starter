//
//  LSIPersonSearchTableViewController.m
//  Star Wars Search ObjC
//
//  Created by Spencer Curtis on 10/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "LSIPersonSearchTableViewController.h"
#import "LSIPersonTableViewCell.h"
#import "LSIPersonController.h"		// Always import .h
#import "LSIPerson.h"

@interface LSIPersonSearchTableViewController ()

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation LSIPersonSearchTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
	self = [super initWithCoder:coder];
	if (self) {
		
		_personController = [[LSIPersonController alloc] init]; // must initializer or we get a no-op when we make method calls
		
	}
	return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setDelegate:self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
	
	[self.personController searchForPeopleWithSearchTerm:searchBar.text completion:^(NSArray *people, NSError *error) {
		dispatch_async(dispatch_get_main_queue(), ^{
			// update UI
			if (error) {
				NSLog(@"Error: %@", error);
				return;
			}
			
			NSLog(@"People: %@", people);
			
			
		});
	}];
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
