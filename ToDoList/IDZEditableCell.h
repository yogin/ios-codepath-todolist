//
//  IDZEditCell.h
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDZEditableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *todoText;

- (void)updateText:(NSString *)text withTag:(NSInteger)tag;

@end
