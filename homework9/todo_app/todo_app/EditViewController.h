//
//  EditViewController.h
//  todo_app
//
//  Created by Dadits on 12/21/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EditViewController : UIViewController


@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *completionLabel;
@property (weak, nonatomic) IBOutlet UISwitch *completionSwitch;
@property (weak, nonatomic) IBOutlet UIDatePicker *todoDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *todoSaveButton;
@end
