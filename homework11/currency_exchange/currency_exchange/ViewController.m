//
//  ViewController.m
//  currency_exchange
//
//  Created by Dadits on 1/18/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@end

@implementation ViewController

@synthesize rULabel;

@synthesize eULabel;

@synthesize usUaLabel;

@synthesize uRLabel;

@synthesize uELabel;

@synthesize uaUsLabel;

@synthesize currencyTypePicker;

@synthesize PickerDatasource;

@synthesize currencyInput;

@synthesize convertButton;

@synthesize resultText;

int leftRow = 0;
int leftComponent =0;
int rightRow = 0;
int rightComponent = 1;

NSArray *arrayCarrencys;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.PickerDatasource = [NSArray arrayWithObjects:@"UAH", @"RUB", @"EUR", @"USD", nil];
    
    NSURL *url = [NSURL URLWithString:@"https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    arrayCarrencys = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    rULabel.text = arrayCarrencys[0][@"buy"];
    eULabel.text = arrayCarrencys[1][@"buy"];
    usUaLabel.text = arrayCarrencys[2][@"buy"];
    
    uRLabel.text = arrayCarrencys[0][@"sale"];
    uELabel.text = arrayCarrencys[1][@"sale"];
    uaUsLabel.text = arrayCarrencys[2][@"sale"];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [PickerDatasource count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [PickerDatasource objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0){
        leftRow = (int)row;
        leftComponent = 0;
    }
    if (component == 1) {
        rightComponent = 1;
        rightRow = (int)row;
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputTextchanged:(id)sender {
    [currencyInput addTarget:self action:@selector(textFieldShouldEndEditing:) forControlEvents:UIControlEventEditingDidEnd];
}

- (IBAction)convertComplite:(id)sender {
    
    //если валюта совпадает
    if (leftRow == rightRow) {resultText.text = currencyInput.text;}
    
    //обрабатываем покупку валют за гривну
    if (leftRow == 0 & rightRow == 1) {
        NSString *stringUahToRub = arrayCarrencys[0][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue/stringUahToRub.floatValue];}
    if (leftRow == 0 & rightRow == 2) {
        NSString *stringUahToEur = arrayCarrencys[1][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue/stringUahToEur.floatValue];}
    if (leftRow == 0 & rightRow == 3) {
        NSString *stringUahToUsd = arrayCarrencys[2][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue/stringUahToUsd.floatValue];}
    
    //обрабатываем покупку валют за рубли
    if (leftRow == 1 & rightRow == 0) {
        NSString *stringRubToUah = arrayCarrencys[0][@"buy"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringRubToUah.floatValue];}
    if (leftRow == 1 & rightRow == 2) {
        NSString *stringRubToUAH = arrayCarrencys[0][@"buy"];
        NSString *stringUahToEur = arrayCarrencys[1][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringRubToUAH.floatValue/stringUahToEur.floatValue];}
    if (leftRow == 1 & rightRow == 3) {
        NSString *stringRubToUAH = arrayCarrencys[0][@"buy"];
        NSString *stringUahToUSD = arrayCarrencys[2][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringRubToUAH.floatValue/stringUahToUSD.floatValue];}
    
    //обрабатываем покупку вылют за евро
    if (leftRow == 2 & rightRow == 0) {
        NSString *stringEurToUah = arrayCarrencys[1][@"buy"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringEurToUah.floatValue];}
    if (leftRow == 2 & rightRow == 1) {
        NSString *stringEurToUah = arrayCarrencys[1][@"buy"];
        NSString *stringUahToRub = arrayCarrencys[0][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringEurToUah.floatValue/stringUahToRub.floatValue];}
    if (leftRow == 2 & rightRow == 3) {
        NSString *stringEurToUah = arrayCarrencys[1][@"buy"];
        NSString *stringUahToUsd = arrayCarrencys[2][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringEurToUah.floatValue/stringUahToUsd.floatValue];}
    
    //обрабатываем покупку валют за доллар
    if (leftRow == 3 & rightRow == 0) {
        NSString *stringUsdToUah = arrayCarrencys[2][@"buy"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringUsdToUah.floatValue];}
    if (leftRow == 3 & rightRow == 1) {
        NSString *stringUsdToUah = arrayCarrencys[2][@"buy"];
        NSString *stringUahToRub = arrayCarrencys[0][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringUsdToUah.floatValue/stringUahToRub.floatValue];}
    if (leftRow == 3 & rightRow == 2) {
        NSString *stringUsdToUah = arrayCarrencys[2][@"buy"];
        NSString *stringUahToEur = arrayCarrencys[1][@"sale"];
        resultText.text = [NSString stringWithFormat:@"%0.2f", currencyInput.text.integerValue*stringUsdToUah.floatValue/stringUahToEur.floatValue];}
    
}

@end
