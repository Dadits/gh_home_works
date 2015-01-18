//
//  DetailViewController.m
//  todo_app
//
//  Created by Dadits on 12/20/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        //[self configureView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self configureView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    } else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateCell" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    } else if(indexPath.section == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DescCell" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    } else if(indexPath.section == 3){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompletionCell" forIndexPath:indexPath];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0){
        cell.textLabel.text = [NSString stringWithFormat:@"Name: %@", [[self.detailItem valueForKey:@"name"] description]];
    } else if(indexPath.section == 1){
        cell.textLabel.text = [NSString stringWithFormat:@"Date: %@", [[self.detailItem valueForKey:@"timeStamp"] description]];
    } else if(indexPath.section == 2){
        cell.textLabel.text = [NSString stringWithFormat:@"Details: %@", [[self.detailItem valueForKey:@"desc"] description]];
    } else if(indexPath.section == 3){
        cell.textLabel.text = [NSString stringWithFormat:@"Completed: %@", [[self.detailItem valueForKey:@"completed"] description]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
