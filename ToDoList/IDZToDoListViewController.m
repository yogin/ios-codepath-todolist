//
//  IDZToDoListViewController.m
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZToDoListViewController.h"
#import "IDZToDoItem.h"
#import "IDZEditCell.h"


@interface IDZToDoListViewController ()

@property (strong, nonatomic) NSMutableArray *todoItems;
@property BOOL shouldEditNewItem;

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
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)setup
{
	[self loadItems];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.todoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EditCell";
    IDZEditCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	IDZToDoItem *item = self.todoItems[indexPath.row];
	
	cell.todoText.delegate = self;
	cell.todoText.text = item.text;
	cell.todoText.tag = indexPath.row;
//	[cell sizeToFit];

    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	cell = (IDZDisplayCell*) cell;
//	[cell.textLabel sizeToFit];
//}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
		[self removeItem:indexPath.row];
		[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
		[self.tableView reloadData];
    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(IDZEditCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (self.shouldEditNewItem && indexPath.row == 0) {
		self.shouldEditNewItem = NO;
		[cell.todoText becomeFirstResponder];
	}
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
	[self moveItemFrom:fromIndexPath.row to:toIndexPath.row];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////	UITextView *tmpText = [[UITextView alloc] init];
//	UILabel *tmpLabel = [[UILabel alloc] init];
//	tmpLabel.numberOfLines = 0;
//	
//	IDZToDoItem *item = self.todoItems[indexPath.row];
//	tmpLabel.text = item.text;
//	
////	CGFloat width = self.tableView.frame.size.width;
//	
//	CGSize size = [tmpLabel sizeThatFits:CGSizeMake(280, MAXFLOAT)];
////	CGSize rect = [item.text sizeWithAttributes:@{NSFontAttributeName: tmpLabel.font}];
//
//	return size.height + 16;
//}

#pragma mark - Actions

- (IBAction)onAddItem:(id)sender
{
	IDZToDoItem *item = [IDZToDoItem itemWithText:@"new task to do"];
	self.shouldEditNewItem = YES;
	[self.todoItems insertObject:item atIndex:0];
	[self.tableView reloadData];
}


- (void)updateItem:(NSInteger)index withText:(NSString *)text
{
	IDZToDoItem *item = self.todoItems[index];
	item.text = text;
	[self updateItemPriorities];
//	item.priority = index;
//	[item saveInBackground];

//	self.todoItems[index] = item;
}

- (void)moveItemFrom:(NSInteger)from to:(NSInteger)to
{
	IDZToDoItem *item = self.todoItems[from];

	[self.todoItems removeObjectAtIndex:from];
	[self.todoItems insertObject:item atIndex:to];
	[self updateItemPriorities];
}

- (void)updateItemPriorities
{
	for (int priority = 0; priority < self.todoItems.count; priority++) {
		IDZToDoItem *item = self.todoItems[priority];
		item.priority = priority;
		[item saveInBackground];
	}
}

- (void)removeItem:(NSInteger)at
{
	[self.todoItems removeObjectAtIndex:at];
	[self saveItems];
}

- (void)loadItems
{
	PFQuery *query = [IDZToDoItem query];
	[query orderByAscending:@"priority"];
	[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
		// TODO: handle error similar to rotten tomatoes

		self.todoItems = [objects mutableCopy];
		[self.tableView reloadData];
	}];
}

- (void)saveItems
{
//	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//	[defaults setObject:self.todoItems forKey:@"todoItems"];
//	[self.todoItems writeToFile:@"todoItems" atomically:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[self updateItem:textField.tag withText:textField.text];
	[textField resignFirstResponder];

	return YES;
}

@end
