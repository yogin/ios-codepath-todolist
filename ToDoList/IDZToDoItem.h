//
//  IDZToDoItem.h
//  ToDoList
//
//  Created by Anthony Powles on 22/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDZToDoItem : NSObject

+ (IDZToDoItem *)itemWithText:(NSString *)text;

- (void)updateText:(NSString *)text;
- (void)deleteItem;
- (NSString *)text;

@end
