//
//  IDZEditCell.m
//  ToDoList
//
//  Created by Anthony Powles on 1/23/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZEditCell.h"

@implementation IDZEditCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
	}
	return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)viewDidLoad
{
	[self.todoCheckbox addTarget:self action:@selector(checkboxDidChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)checkboxDidChanged:(CTCheckbox *)checkbox
{
    NSLog(@"%d", checkbox.checked);
}

@end
