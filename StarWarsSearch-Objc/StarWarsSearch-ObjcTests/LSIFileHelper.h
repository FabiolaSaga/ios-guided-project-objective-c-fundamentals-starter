//
//  LSIFileHelper.h
//  iOS8-Quakes-ObjcTests
//
//  Created by Paul Solt on 10/8/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// FIXME: This needs a .h and .m file so it doesn't cause duplicate symbols if imported more
// than 1 time!

NSData *loadFile(NSString *filename, NSBundle *bundle) {
	NSString *basename = [filename stringByDeletingPathExtension];
	NSString *extension = [filename pathExtension];
	
	NSString *path = [bundle pathForResource:basename ofType:extension];
	NSData *data = [NSData dataWithContentsOfFile:path];
	return data;
}
