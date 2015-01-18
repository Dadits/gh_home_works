//
//  ViewController.h
//  currency_exchange
//
//  Created by Dadits on 1/18/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *rULabel;

@property (weak, nonatomic) IBOutlet UILabel *eULabel;

@property (weak, nonatomic) IBOutlet UILabel *usUaLabel;

@property (weak, nonatomic) IBOutlet UILabel *uRLabel;

@property (weak, nonatomic) IBOutlet UILabel *uELabel;

@property (weak, nonatomic) IBOutlet UILabel *uaUsLabel;

@property (weak, nonatomic) IBOutlet UIPickerView *currencyTypePicker;

@property (weak, nonatomic) IBOutlet UITextField *currencyInput;


- (IBAction)inputTextchanged:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *convertButton;


- (IBAction)convertComplite:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *resultText;

@property NSArray *PickerDatasource;

@end

