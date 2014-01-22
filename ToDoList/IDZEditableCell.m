//
//  IDZEditCell.m
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZEditableCell.h"

@interface IDZEditableCell ()

//@property CGSize originalSize;
//@property CGSize originalTextfieldSize;

@end

@implementation IDZEditableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateText:(NSString *)text withTag:(NSInteger)tag
{
	self.todoText.text = text;
	self.todoText.tag = tag;


	
//	[self.todoText sizeToFit];
}

- (void)awakeFromNib
{
//	[super awakeFromNib];
//	NSLog(@"awakeFromNib");
//	
//	self.originalSize = self.bounds.size;
//	self.originalTextfieldSize = self.todoText.bounds.size;
//	NSLog(@"%@", self.todoText);
}

@end
