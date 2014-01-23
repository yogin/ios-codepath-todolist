//
//  IDZToDoListViewController.m
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZToDoListViewController.h"
#import "IDZToDoItem.h"
#import "IDZDisplayCell.h"


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
 
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
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
    static NSString *CellIdentifier = @"DisplayCell";
    IDZDisplayCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	IDZToDoItem *item = self.todoItems[indexPath.row];
	
	cell.todoLabel.text = item.text;
	cell.tag = indexPath.row;

    return cell;
}

// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
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


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
	[self moveItemFrom:fromIndexPath.row to:toIndexPath.row];
}


// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	UITextView *tmpText = [[UITextView alloc] init];
//	tmpText.text = self.todoItems[indexPath.row];
//	
//	CGFloat width = self.tableView.frame.size.width;
//	
//	CGSize size = [tmpText sizeThatFits:CGSizeMake(300, MAXFLOAT)];
//
//	return size.height;
//}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
	
	if ([[segue identifier] isEqual:@"editItemSegue"]) {
		IDZEditItemViewController *editVC = [segue destinationViewController];
		editVC.delegate = self;
		UITableViewCell *cell = (UITableViewCell *) sender;
		IDZToDoItem *item = self.todoItems[cell.tag];
		[editVC setText:item.text withIndex:cell.tag];
	}
}


#pragma mark - Actions

- (IBAction)onAddItem:(id)sender
{
	IDZToDoItem *item = [IDZToDoItem itemWithText:@"new task to do"];
	[self.todoItems insertObject:item atIndex:0];
	[self.tableView reloadData];
}


- (void)updateItem:(NSInteger)index withText:(NSString *)text
{
	IDZToDoItem *item = self.todoItems[index];
	[item updateText:text];
	self.todoItems[index] = item;
}

- (void)moveItemFrom:(NSInteger)from to:(NSInteger)to
{
	IDZToDoItem *item = self.todoItems[from];

	[self.todoItems removeObjectAtIndex:from];
	[self.todoItems insertObject:item atIndex:to];
//	[self saveItems];
}

- (void)removeItem:(NSInteger)at
{
	[self.todoItems removeObjectAtIndex:at];
	[self saveItems];
}

- (void)loadItems
{
//	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//	NSArray *savedItems = [defaults arrayForKey:@"todoItems"];
//
//	if (savedItems) {
//		self.todoItems = [savedItems mutableCopy];
//	}
//	else {
//		self.todoItems = [[NSMutableArray alloc] init];
//	}
//	
	self.todoItems = [[NSMutableArray alloc] init];
}

- (void)saveItems
{
//	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//	[defaults setObject:self.todoItems forKey:@"todoItems"];
}


#pragma mark - IDZEditItemViewControllerDelegate

- (void)updateToDoItemText:(NSString *)text atIndex:(NSInteger)index
{
	[self updateItem:index withText:text];
	[self.tableView reloadData];
}

@end
