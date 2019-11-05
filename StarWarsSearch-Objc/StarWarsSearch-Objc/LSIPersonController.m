//
//  LSIPersonController.m
//  StarWarsSearch-Objc
//
//  Created by Paul Solt on 11/5/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIPersonController.h"
#import "LSIPerson.h"

@implementation LSIPersonController

//https://swapi.co/api/people?search=luke
static NSString *const baseURLString = @"https://swapi.co/api/people";

- (void)searchForPeopleWithSearchTerm:(NSString *)searchTerm
						   completion:(void (^)(NSArray *people, NSError *error))completion {
	
	// URL to request data
	NSURL *baseURL = [NSURL URLWithString:baseURLString];
	
	// YES = true, NO = false in Objective-C (Boolean values)
	// BOOL
	NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
	NSURLQueryItem *searchItem = [NSURLQueryItem queryItemWithName:@"search" value:searchTerm];
	[components setQueryItems: @[searchItem]];
	
	NSURL *url = [components URL];
	NSLog(@"URL: %@", url);
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	// Make our request URLSession
	NSURLSessionDataTask *task = [NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
		
		NSLog(@"Search results");
		
		// check for error, call completion
		if (error) {
			completion(nil, error);
			return;
		}
		
		if (data == nil) {
			NSLog(@"Data was nil");
			completion(nil, [[NSError alloc] init]); // TODO: Create a meaningful error type
			return;
		}
		
		NSError *jsonError = nil;
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
		if(jsonError) {
			completion(nil, error);
			return;
		}
		
		
		if (![json isKindOfClass:[NSDictionary class]]) { // [NSArray class] [NSNull class]
			NSLog(@"JSON was not a top level dictionary as expected");
			completion(nil, [[NSError alloc] init]); // TODO: Create a meaningful error type
			return;
		}
		
		// Loop through the data and transform from a dictionary to LSIPerson
		
		NSArray *results = json[@"results"];						// let results = []
		NSMutableArray *people = [[NSMutableArray alloc] init];		// var people = []
		
		// NSArray of NSDictionary
		for (NSDictionary *dictionary in results) {
			LSIPerson *person = [[LSIPerson alloc] initWithDictionary:dictionary];
			[people addObject:person];  // people.append(person)
		}
		completion(people, nil);
		
	}];
	[task resume];
	
	
	
	
}


@end
