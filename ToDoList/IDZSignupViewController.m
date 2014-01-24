//
//  IDZSignupViewController.m
//  ToDoList
//
//  Created by Anthony Powles on 23/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZSignupViewController.h"

@interface IDZSignupViewController ()

@end

@implementation IDZSignupViewController

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
	// Do any additional setup after loading the view.
	
	UILabel *titleLabel = [[UILabel alloc] init];
	titleLabel.text = @"Stuff To Do!";
	titleLabel.font = [UIFont boldSystemFontOfSize:30];
	titleLabel.shadowColor = [UIColor blackColor];
	titleLabel.shadowOffset = CGSizeMake(1, 1);
	titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    self.signUpView.logo = titleLabel;
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark-tile.gif"]];
	
	self.signUpView.usernameField.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
	self.signUpView.usernameField.textColor = [UIColor whiteColor];
	[self.signUpView.usernameField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
	
	self.signUpView.passwordField.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
	self.signUpView.passwordField.textColor = [UIColor whiteColor];
	[self.signUpView.passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
	
	self.signUpView.emailField.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
	self.signUpView.emailField.textColor = [UIColor whiteColor];
	[self.signUpView.emailField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
