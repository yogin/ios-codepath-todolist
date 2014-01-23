//
//  IDZEditItemViewController.m
//  ToDoList
//
//  Created by Anthony Powles on 22/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZEditItemViewController.h"

@interface IDZEditItemViewController ()

@property (weak, nonatomic) IBOutlet UITextView *itemText;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *itemTextBottomConstraint;

- (IBAction)onDoneButton:(id)sender;

@end

@implementation IDZEditItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
	[self.itemText becomeFirstResponder];
}

- (void)setup
{
	self.itemText.delegate = self;
	
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasShown:)
												 name:UIKeyboardDidShowNotification object:nil];
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)notification
{
	NSDictionary *info = [notification userInfo];
    NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
	
    CGRect keyboardFrame = [kbFrame CGRectValue];
    CGRect finalKeyboardFrame = [self.view convertRect:keyboardFrame fromView:self.itemText.window];
	
    int kbHeight = finalKeyboardFrame.size.height;
    int height = kbHeight + self.itemTextBottomConstraint.constant;
	
    self.itemTextBottomConstraint.constant = height;
	
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:animationDuration animations:^{
        [self.itemText layoutIfNeeded];
    }];
}

- (IBAction)onDoneButton:(id)sender
{
}

@end
