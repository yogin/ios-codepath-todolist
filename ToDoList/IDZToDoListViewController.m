//
//  IDZToDoListViewController.m
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZToDoListViewController.h"
#import "IDZEditableCell.h"

@interface IDZToDoListViewController ()

@property (strong, nonatomic) NSMutableArray *todoItems;

- (IBAction)onAddItem:(id)sender;

- (void)setup;

@end

@implementation IDZToDoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
	[self loadItems];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.todoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EditableCell";
    IDZEditableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
	cell.todoText.delegate = self;
	[cell updateText:self.todoItems[indexPath.row] withTag:indexPath.row];

	
	//	CGFloat textFieldWidth = self.todoText.frame.size.width;
	//	CGSize newTextFieldSize = [self.todoText sizeThatFits:CGSizeMake(textFieldWidth, MAXFLOAT)];
	//	NSLog(@"width: %@", newTextFieldSize);
	//	CGRect newTextFieldFrame = self.todoText.frame;
	//	newTextFieldFrame.size = CGSizeMake(fmaxf(newTextFieldSize.width, textFieldWidth), newTextFieldSize.height);
	//	self.todoText.frame = newTextFieldFrame;
	
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
		[self removeItem:indexPath.row];
		[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		[self.tableView reloadData];
    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
	[self moveItemFrom:fromIndexPath.row to:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITextView *tmpText = [[UITextView alloc] init];
	tmpText.text = self.todoItems[indexPath.row];
	
	CGFloat width = self.tableView.frame.size.width;
	CGSize size = [tmpText sizeThatFits:CGSizeMake(width, MAXFLOAT)];

	return size.height;
	
//    UITextView *tempTV = [[UITextView alloc] init];
//	[tempTV setText:@"your text"];
//	CGFloat width = self.tableView.frame.size.width - TEXT_ORIGIN_X - TEXT_END_X;
//	CGSize size = [tempTV sizeThatFits:CGSizeMake(width, MAX_HEIGHT)];
//	return (TEXT_ORIGIN_Y + size.height + TEXT_BOTTOM_SPACE);
	
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

#pragma mark - Actions

- (IBAction)onAddItem:(id)sender
{
	[self addItem:@"new task to do"];
	[self.tableView reloadData];
}

- (void)addItem:(NSString *)task
{
	[self.todoItems insertObject:task atIndex:0];
	[self saveItems];
}

- (void)updateItem:(NSInteger)index withText:(NSString *)task
{
	self.todoItems[index] = task;
	[self saveItems];
}

- (void)moveItemFrom:(NSInteger)from to:(NSInteger)to
{
	NSString *todoItem = self.todoItems[from];

	[self.todoItems removeObjectAtIndex:from];
	[self.todoItems insertObject:todoItem atIndex:to];
	[self saveItems];
}

- (void)removeItem:(NSInteger)at
{
	[self.todoItems removeObjectAtIndex:at];
	[self saveItems];
}

- (void)loadItems
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *savedItems = [defaults arrayForKey:@"todoItems"];

	if (savedItems) {
		self.todoItems = [savedItems mutableCopy];
	}
	else {
		self.todoItems = [[NSMutableArray alloc] init];
	}
}

- (void)saveItems
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:self.todoItems forKey:@"todoItems"];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self updateItem:textField.tag withText:textField.text];
	[textField resignFirstResponder];

	return YES;
}

@end
