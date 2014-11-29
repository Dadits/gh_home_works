//
//  ViewController.m
//  ui_elements
//
//  Created by Dadits on 11/29/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.randomWords = @[@"Hello", @"Привіт", @"Dia duit", @"Hallo", @"Bonjour", @"您好", @"こんにちは", @"Përshëndetje", @"Salve", @"שלום", @"Բարեւ Ձեզ"];
    // Do any additional setup after loading the view, typically from a nib.
    self.moreLess.value = 37;
    [self handleSegmentChooser];
    [self setSliderValue];
    [self setMoreLessLabel];
}

- (NSString *) defineSegmentNumber {
    return [@(self.segmentChooser.selectedSegmentIndex + 1) stringValue];
}

- (void) handleSegmentChooser {
    self.segmentChooserLabel.text = [self defineSegmentNumber];
}

- (void) setSliderValue {
    self.sliderLabel.text = [NSString stringWithFormat:@"%0.0f", (self.horizontalSlider.value *100)];
}

- (void) setMoreLessLabel {
    self.moreLessLabel.text = [@(self.moreLess.value) stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomizeString:(id)sender {
    self.changeValueLabel.text = [self.randomWords objectAtIndex:(rand() % self.randomWords.count)];
}
- (IBAction)chooseSegmentValue:(id)sender {
    [self handleSegmentChooser];
}
- (IBAction)showSomeText:(id)sender {
    self.textInputLabel.text = self.textInput.text;
}
- (IBAction)showSliderValue:(id)sender {
    [self setSliderValue];
}
- (IBAction)showAlert:(id)sender {
    UIAlertView *testAlert = [[UIAlertView alloc] initWithTitle:@"This is test alert!" message:@"If you see this alert, then you're fine!" delegate:self cancelButtonTitle:@"Cool!" otherButtonTitles:nil];
    [testAlert show];
}
- (IBAction)startSpinning:(id)sender {
    if ([self.spinningLoader isAnimating])
        [self.spinningLoader stopAnimating];
    else
        [self.spinningLoader startAnimating];
}

- (IBAction)stopSpinning:(id)sender {
    [self.spinningLoader stopAnimating];
}
- (IBAction)addRemove:(id)sender {
    [self setMoreLessLabel];
}
- (IBAction)showImage:(id)sender {
    self.simpleImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apple" ofType:@"png"]];
}
@end
