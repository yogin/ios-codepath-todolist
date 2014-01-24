//
//  IDZLoginViewController.m
//  ToDoList
//
//  Created by Anthony Powles on 23/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZLoginViewController.h"

@interface IDZLoginViewController ()

@end

@implementation IDZLoginViewController

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
    self.logInView.logo = titleLabel;
	
	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark-tile.gif"]];

	self.logInView.usernameField.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
	self.logInView.usernameField.textColor = [UIColor whiteColor];
	[self.logInView.usernameField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];

	self.logInView.passwordField.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.6];
	self.logInView.passwordField.textColor = [UIColor whiteColor];
	[self.logInView.passwordField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
