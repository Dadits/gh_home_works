//
//  ViewController.h
//  ui_elements
//
//  Created by Dadits on 11/29/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSArray *randomWords;
@property (strong, nonatomic) IBOutlet UIScrollView *rootScroll;

@property (strong, nonatomic) IBOutlet UIButton *changeValueButton;
- (IBAction)randomizeString:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *changeValueLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentChooser;
- (IBAction)chooseSegmentValue:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *segmentChooserLabel;

@property (strong, nonatomic) IBOutlet UITextField *textInput;
- (IBAction)showSomeText:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *textInputLabel;

@property (strong, nonatomic) IBOutlet UISlider *horizontalSlider;
- (IBAction)showSliderValue:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *sliderLabel;

@property (strong, nonatomic) IBOutlet UISwitch *simpleSwitcher;
- (IBAction)showAlert:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *spinButton;
- (IBAction)startSpinning:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinningLoader;

@property (strong, nonatomic) IBOutlet UIStepper *moreLess;
- (IBAction)addRemove:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *moreLessLabel;

@property (strong, nonatomic) IBOutlet UIButton *imageButton;
- (IBAction)showImage:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *simpleImageView;

@end

