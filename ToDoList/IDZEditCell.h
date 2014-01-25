//
//  IDZEditCell.h
//  ToDoList
//
//  Created by Anthony Powles on 1/23/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTCheckbox.h"

@interface IDZEditCell : UITableViewCell

@property (weak, nonatomic) IBOutlet CTCheckbox *todoCheckbox;
@property (weak, nonatomic) IBOutlet UITextView *todoText;

@end
