//
//  IDZEditItemViewController.h
//  ToDoList
//
//  Created by Anthony Powles on 22/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IDZEditItemViewController;

@protocol IDZEditItemViewControllerDelegate <NSObject>

- (void)updateToDoItemText:(NSString *)text atIndex:(NSInteger)index;

@end

@interface IDZEditItemViewController : UIViewController <UITextViewDelegate>

@property (weak, nonatomic) id <IDZEditItemViewControllerDelegate> delegate;

- (void)setText:(NSString *)text withIndex:(NSInteger)index;

@end
