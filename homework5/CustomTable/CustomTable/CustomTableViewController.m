//
//  CustomTableViewController.m
//  CustomTable
//
//  Created by Dadits on 11/15/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import "CustomTableViewController.h"

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstTableView = [[UITableView alloc] init];
	//self.firstTableView.frame = self.view.frame;
    self.firstTableView.frame = CGRectMake(0, 320, 320, 480);
    [self.view addSubview:self.firstTableView];
    self.firstTableView.dataSource = self;

    self.df = [NSDateFormatter new];
    self.monthsKeys = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++)
        [self.monthsKeys addObject:[NSString stringWithFormat:@"%i", i]];
    
    self.formatedMonths = [NSDictionary dictionaryWithObjects: [[self.df monthSymbols] subarrayWithRange:NSMakeRange(0, 5)]
                                                      forKeys: self.monthsKeys];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.formatedMonths count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    NSString *myKey = [NSString stringWithFormat:@"%ld", indexPath.row];
    if (tableView == self.firstTableView) {
        cell.textLabel.text = [self.formatedMonths objectForKey:myKey];

    } else { // tableView == self.secondTableView
        cell.textLabel.text = [NSString stringWithFormat:@"CELL #%ld", indexPath.row + 1];
    }
    return cell;
}


@end

