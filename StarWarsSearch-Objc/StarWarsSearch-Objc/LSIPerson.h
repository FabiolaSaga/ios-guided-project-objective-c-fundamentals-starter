//
//  LSIPerson.h
//  StarWarsSearch-Objc
//
//  Created by Paul Solt on 1/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


//class Person: NSObject {
//	let name: String
//}

@interface LSIPerson : NSObject

@property NSString *name;
// 1. setter
//- (void)setName:(NSString *)name;
// 2. getter
//- (NSString *)name;
// 3. instance variable
//NSString *_name;

@property NSString *birthYear;
@property NSString *height;
@property NSString *eyeColor;

// Parsing from JSON
// 1. Create initializer that can setup object from NSDictionary (NS = NextStep)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithName:(NSString *)name
				   birthYear:(NSString *)birthYear
					  height:(NSString *)height
					eyeColor:(NSString *)eyeColor;


@end

NS_ASSUME_NONNULL_END
