//
//  EditViewController.m
//  todo_app
//
//  Created by Dadits on 12/21/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        //[self configureView];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationItem.rightBarButtonItem = self.saveButtonItem;
    [self.nameTextField setText:[NSString stringWithFormat:@"Name: %@", [[self.detailItem valueForKey:@"name"] description]]];
    NSDate* todoDate = [self.detailItem valueForKey:@"timeStamp"];
    [self.todoDatePicker setDate:todoDate];
    [self.descTextField setText:[self.detailItem valueForKey:@"desc"]];
    //[self.completionSwitch setOn: [self.detailItem objectForKey:@"complete"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.detailItem) {
        // Update existing device
        [self.detailItem setValue:self.nameTextField.text forKey:@"name"];
        [self.detailItem setValue:self.descTextField.text forKey:@"desc"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
