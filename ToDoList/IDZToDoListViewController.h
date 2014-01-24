//
//  IDZToDoListViewController.h
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "IDZEditCell.h"

@interface IDZToDoListViewController : UITableViewController <UITextFieldDelegate, UITextViewDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@end
