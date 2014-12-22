//
//  DetailViewController.h
//  todo_app
//
//  Created by Dadits on 12/20/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UITableView *DetailsTable;
@end

