//
//  IDZToDoItem.h
//  ToDoList
//
//  Created by Anthony Powles on 22/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface IDZToDoItem : PFObject<PFSubclassing>

+ (NSString *)parseClassName;
+ (IDZToDoItem *)itemWithText:(NSString *)text forUser:(PFUser *)user;

@property (retain) NSString *text;
@property NSInteger priority;

@end
