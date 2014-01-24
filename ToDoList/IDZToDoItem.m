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
	
	return item;
}

@end
