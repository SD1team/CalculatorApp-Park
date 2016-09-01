//
//  ViewController.m
//  CalculatorApp
//
//  Created by ios on 2016. 8. 30..
//  Copyright © 2016년 ios. All rights reserved.
//

#import "ViewController.h"

#define INPUT_NUMBER 1
#define INPUT_OPERATOR 2
#define INPUT_EQUAL 3
#define INPUT_CLEAR 4

@interface ViewController ()

@end

@implementation ViewController

@synthesize valueLabel;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    calculator = [[Calculator alloc] init];
    
    [self clearCalculator];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction) clickNumber: (UIButton *) sender {
    
    if(lastInputType == INPUT_EQUAL) [self clearCalculator];
    if(lastInputType == INPUT_OPERATOR) valueLabel.text = @"";
    
    if([valueLabel.text isEqualToString:@"0"]) valueLabel.text = @"";
    
    valueLabel.text = [valueLabel.text stringByAppendingString:[NSString stringWithFormat:@"%li", sender.tag]];
    
    lastInputType = INPUT_NUMBER;
}

- (IBAction)clickOperator:(UIButton *)sender{
    
    if(lastInputType == INPUT_CLEAR || lastInputType == INPUT_OPERATOR) return;
    if(lastInputType == INPUT_EQUAL) preOper = @"";
    
    calculator.currentValue = [valueLabel.text intValue];
    [calculator calculate:preOper];
    valueLabel.text = [NSString stringWithFormat:@"%i", calculator.resultValue];
    
    preOper = sender.restorationIdentifier;
    
    lastInputType = INPUT_OPERATOR;
}

- (IBAction) clickEqual: (UIButton *) sender {
    
    if(lastInputType == INPUT_OPERATOR || lastInputType == INPUT_CLEAR) return;
    
    if(lastInputType != INPUT_EQUAL) calculator.currentValue = [valueLabel.text intValue];
    
    [calculator calculate:preOper];
    valueLabel.text = [NSString stringWithFormat:@"%i", calculator.resultValue];
    
    lastInputType = INPUT_EQUAL;
}

- (IBAction) clickClear: (UIButton *) sender {
    
    [self clearCalculator];
    lastInputType = INPUT_CLEAR;
}

- (void) clearCalculator {
    
    [calculator initMemberVar];
    valueLabel.text = @"0";
    preOper = @"";
}

@end
