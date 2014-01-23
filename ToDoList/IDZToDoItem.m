//
//  IDZToDoItem.m
//  ToDoList
//
//  Created by Anthony Powles on 22/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZToDoItem.h"
//#import <Parse/Parse.h>

@interface IDZToDoItem ()

@property (strong, nonatomic) NSString *text;

@end

@implementation IDZToDoItem

+ (IDZToDoItem *)itemWithText:(NSString *)text
{
	IDZToDoItem *item = [[IDZToDoItem alloc] init];
	[item updateText:text];
	
	return item;
}

- (void)updateText:(NSString *)text
{
	self.text = text;
}

- (void)deleteItem
{
	
}

- (NSString *)text
{
	return _text;
}

@end
