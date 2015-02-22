//
//  ViewController.m
//  clubformer
//
//  Created by Dadits on 2/22/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *savedSubscribersData;
    NSString *requestUrl;
    NSString *apiToken;
    AFHTTPRequestOperationManager *manager;
    SCLAlertView *alert;
}
@end

@implementation ViewController
@synthesize masterTable = masterTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    manager = [AFHTTPRequestOperationManager manager];
    self.title = @"Clubformer Subscribers";
    
    savedSubscribersData = [NSMutableArray new];
    requestUrl = @"http://clubformerlanding.herokuapp.com/api/v1/subscriptions/all";
    apiToken = @"b602c108-18df-484f-ac0c-a6dad3674925";
    
    //[self refreshData];
    
    [self.masterTable addPullToRefreshWithActionHandler:^{
        [self startSubscriptionsUpload];
    }];
    
    alert = [[SCLAlertView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

#pragma mark - Refresh
//-(void) refreshData {
//    [savedSubscribersData removeAllObjects];
//    NSArray *allRecords = [Subscription findAllSortedBy:@"email" ascending:YES];
//    [savedSubscribersData addObjectsFromArray:allRecords];
//    [self.tableView reloadData];
//}

- (void)startSubscriptionsUpload {
    if (![self connected]) {
        [alert showError:self title:@"Connection Error" subTitle:@"Please connect to the internet." closeButtonTitle:@"OK" duration:0.0f];
        [self.tableView.pullToRefreshView stopAnimating];
    } else {
        [self getData];
    }
}

-(void)getData {
    NSDictionary *params = @{@"api_token": apiToken};
    [manager GET:requestUrl parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             //stopped here, next step - parse and save data
             NSLog(@"JSON: %@", responseObject);
             [self.tableView.pullToRefreshView stopAnimating];
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             [alert showError:self title:@"Oops" subTitle:@"Something went wrong" closeButtonTitle:@"OK" duration:0.0f];
             [self.tableView.pullToRefreshView stopAnimating];
         }];
}

@end
