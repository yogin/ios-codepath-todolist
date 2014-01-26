//
//  IDZToDoItem.m
//  ToDoList
//
//  Created by Anthony Powles on 22/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZToDoItem.h"
#import <Parse/PFObject+Subclass.h>

@implementation IDZToDoItem

@dynamic text;
@dynamic priority;
@dynamic completed;

+ (NSString *)parseClassName
{
	return @"Task";
}

+ (IDZToDoItem *)itemWithText:(NSString *)text forUser:(PFUser *)user
{
	IDZToDoItem *item = [IDZToDoItem object];
	item.ACL = [PFACL ACLWithUser:user];
	item.text = text;
	item.priority = 0;
	item.completed = nil;
	
	return item;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
//	NSLog(@"encoding %@", self);
	
	// PFObject basic properties
	[encoder encodeObject:self.parseClassName forKey:@"objectClassName"];
	[encoder encodeObject:self.objectId forKey:@"objectId"];
	[encoder encodeDouble:[self.createdAt timeIntervalSinceReferenceDate] forKey:@"createdAt"];
	[encoder encodeDouble:[self.updatedAt timeIntervalSinceReferenceDate] forKey:@"updatedAt"];
	[encoder encodeObject:self.allKeys forKey:@"objectAllKeys"];

	// IDZToDoItem properties
	for (NSString *key in self.allKeys) {
		// TODO: need to add NSCoder support to PFACL ... :(
		if (![key isEqualToString:@"ACL"]) {
			[encoder encodeObject:self[key] forKey:key];
		}
	}
}

- (id)initWithCoder:(NSCoder *)decoder
{
//	NSLog(@"decoding %@", decoder);

	NSString *objectId = [decoder decodeObjectForKey:@"objectId"];
	NSString *className = [decoder decodeObjectForKey:@"objectClassName"];

	self = (IDZToDoItem *)[PFObject objectWithoutDataWithClassName:className objectId:objectId];
	if (self) {
		self[@"createdAt"] = [NSDate dateWithTimeIntervalSinceReferenceDate:[decoder decodeDoubleForKey:@"createdAt"]];
		self[@"updatedAt"] = [NSDate dateWithTimeIntervalSinceReferenceDate:[decoder decodeDoubleForKey:@"updatedAt"]];
		
		for (NSString *key in [decoder decodeObjectForKey:@"objectAllKeys"]) {
			id object = [decoder decodeObjectForKey:key];
			self[key] = object;
		}
	}

	return self;
}

@end
