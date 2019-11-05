//
//  LSIPerson.m
//  StarWarsSearch-Objc
//
//  Created by Paul Solt on 11/5/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIPerson.h"

@implementation LSIPerson

- (instancetype)initWithName:(NSString *)name
				   birthYear:(NSString *)birthYear
					  height:(NSString *)height
					eyeColor:(NSString *)eyeColor {
	if (self = [super init]) {
		// Always use instance variables (_variableName) for assignment
		// to prevent side effects from using properties before
		// the object is fully initialized
		_name = name;
		_birthYear = birthYear;
		_height = height;
		_eyeColor = eyeColor;
	}
	return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	
	// TODO: Change the model to not just be strings
	
//	"name": "Luke Skywalker",
//	"height": "172",
//	"mass": "77",
//	"hair_color": "blond",
//	"skin_color": "fair",
//	"eye_color": "blue",
//	"birth_year": "19BBY",
//	"gender": "male",
	
	NSString *name = dictionary[@"name"];
	NSString *birthYear = dictionary[@"birth_year"];
	NSString *height = dictionary[@"height"];
	NSString *eyeColor = dictionary[@"eye_color"];
	
//	NSNumber *temp = dictionary[@"temp"];
//	double tempAsDouble = temp.doubleValue;
	
	return [self initWithName:name birthYear:birthYear height:height eyeColor:eyeColor];
}

@end
