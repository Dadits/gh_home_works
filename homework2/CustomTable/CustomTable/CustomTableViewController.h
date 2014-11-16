//
//  CustomTableViewController.h
//  CustomTable
//
//  Created by Dadits on 11/15/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *firstTableView;
@property (strong, nonatomic) IBOutlet UITableView *secondTableView;
@property (strong, nonatomic) NSDateFormatter *df;
@property (strong, nonatomic) NSMutableArray *monthsKeys;
@property (strong, nonatomic) NSDictionary *formatedMonths;

@end
