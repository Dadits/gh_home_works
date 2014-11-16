//
//  AppDelegate.m
//  CustomTable
//
//  Created by Dadits on 11/15/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//


#import "CustomTableViewController.h"

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    self.window.frame = CGRectMake(0, 0, 320, 480); //[UIScreen mainScreen].bounds
    CustomTableViewController *controller = [[CustomTableViewController alloc] init];
    controller.view.backgroundColor = [UIColor yellowColor];
    
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}


@end