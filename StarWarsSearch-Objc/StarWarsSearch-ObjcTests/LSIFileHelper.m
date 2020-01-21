//
//  LSIFileHelper.m
//  StarWarsSearch-ObjcTests
//
//  Created by Paul Solt on 1/21/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


NSData *loadFile(NSString *filename, NSBundle *bundle) {
	NSString *basename = [filename stringByDeletingPathExtension];
	NSString *extension = [filename pathExtension];
	
	NSString *path = [bundle pathForResource:basename ofType:extension];
	NSData *data = [NSData dataWithContentsOfFile:path];
	return data;
}
