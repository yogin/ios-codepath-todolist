//
//  IDZAppDelegate.m
//  ToDoList
//
//  Created by Anthony Powles on 20/01/14.
//  Copyright (c) 2014 Anthony Powles. All rights reserved.
//

#import "IDZAppDelegate.h"
#import <Parse/Parse.h>
#import "IDZToDoItem.h"

@implementation IDZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[IDZToDoItem registerSubclass];
	[Parse setApplicationId:@"YI3bUVjYvZT0NZAh78sdLaXKbn77ig8RRXQA5Zhb"
				  clientKey:@"VvxDySAJB9wyszaGI6ThTQpEWO22SX38eheiQXYc"];
	[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

//	[PFUser enableAutomaticUser];
//	PFACL *defaultACL = [PFACL ACL];
//	[PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
