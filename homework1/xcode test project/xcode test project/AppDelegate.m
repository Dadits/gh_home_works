//
//  AppDelegate.m
//  xcode test project
//
//  Created by Dadits on 10/20/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *methods = @[@"switch enum", @"if else if"];
    
    int rndIndex = arc4random() % [methods count];
    NSString *rndMethod = [methods objectAtIndex:rndIndex];

    NSDateFormatter *df = [NSDateFormatter new];
    NSMutableArray *monthsKeys = [NSMutableArray array];
    
    for (int i = 1; i < 13; i++)
        [monthsKeys addObject:[NSNumber numberWithInteger:i]];
    
    NSDictionary *formatedMonths = [NSDictionary dictionaryWithObjects: [df monthSymbols]
                                                               forKeys: monthsKeys];
    NSMutableArray *resultingMonths = [NSMutableArray array];
    
    typedef NS_ENUM(NSInteger, Months) {
        Jan = 1,
        Feb = 2,
        Mar = 3,
        Apr = 4,
        May = 5,
        Jun = 6,
        July = 7,
        Aug = 8,
        Sept = 9,
        Oct = 10,
        Nov = 11,
        Dec = 12
    };
    
    
        
    if ([rndMethod isEqual: [methods objectAtIndex: 1]]) {
        for (int i=1; i < 13; i++) {
            for (NSString *monthNumber in formatedMonths) {
                id value = [formatedMonths objectForKey:monthNumber];
                if (i == [monthNumber intValue]) {
                    [resultingMonths addObject: [NSString stringWithFormat:@"%@ - %i", value, [monthNumber intValue]]];
                }
            }
        }

    } else if ([rndMethod isEqual: [methods objectAtIndex: 0]]) {
        for (int i=1; i < 13; i++) {
            Months month = (Months) i;
            switch (month) {
                case Jan:
                    [resultingMonths addObject: [NSString stringWithFormat:@"January - %ld", month]];
                    break;
                case Feb:
                    [resultingMonths addObject: [NSString stringWithFormat:@"February - %ld", month]];
                    break;
                case Mar:
                    [resultingMonths addObject: [NSString stringWithFormat:@"March - %ld", month]];
                    break;
                case Apr:
                    [resultingMonths addObject: [NSString stringWithFormat:@"April - %ld", month]];
                    break;
                case May:
                    [resultingMonths addObject: [NSString stringWithFormat:@"May - %ld", month]];
                    break;
                case Jun:
                    [resultingMonths addObject: [NSString stringWithFormat:@"June - %ld", month]];
                    break;
                case July:
                    [resultingMonths addObject: [NSString stringWithFormat:@"July - %ld", month]];
                    break;
                case Aug:
                    [resultingMonths addObject: [NSString stringWithFormat:@"August - %ld", month]];
                    break;
                case Sept:
                    [resultingMonths addObject: [NSString stringWithFormat:@"September - %ld", month]];
                    break;
                case Oct:
                    [resultingMonths addObject: [NSString stringWithFormat:@"October - %ld", month]];
                    break;
                case Nov:
                    [resultingMonths addObject: [NSString stringWithFormat:@"November - %ld", month]];
                    break;
                case Dec:
                    [resultingMonths addObject: [NSString stringWithFormat:@"December - %ld", month]];
                    break;
            }
        }
        
    }

    NSLog(@"Chosen method: %@\r %@", rndMethod, resultingMonths);
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
