//
//  LSIPerson.h
//  StarWarsSearch-Objc
//
//  Created by Paul Solt on 11/5/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// Public interface

@interface LSIPerson : NSObject

@property NSString *name;
@property NSString *birthYear;
@property NSString *height;
@property NSString *eyeColor;

- (instancetype)initWithName:(NSString *)name
				   birthYear:(NSString *)birthYear
					  height:(NSString *)height
					eyeColor:(NSString *)eyeColor;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
