//
//  ViewController.m
//  CalculatorApp
//
//  Created by ios on 2016. 8. 30..
//  Copyright © 2016년 ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize valueLabel;



- (void) viewDidLoad {
    [super viewDidLoad];
    calculator = [[Calculator alloc] init];
    [calculator initMemberVar];
    isReadyToInputNewValue = true;
    isReadyToReplay = false;
    isSelectedOperator = false;
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction) clickNumber: (UIButton *) sender {
    
    if(isReadyToInputNewValue || [valueLabel.text isEqualToString:@"0"]) {
        valueLabel.text = @"";
        isReadyToReplay = false;
        isSelectedOperator = false;
    }
    valueLabel.text = [valueLabel.text stringByAppendingString:[NSString stringWithFormat:@"%li", sender.tag]];
    
    isReadyToInputNewValue = false;
}

- (IBAction) clickOperator: (UIButton *) sender {
    
    isReadyToReplay = false;
    
    if(isSelectedOperator) return;
    
    calculator.currentValue = [valueLabel.text intValue];
    [calculator calculate:preOper];
    valueLabel.text = [NSString stringWithFormat:@"%i", calculator.resultValue];
    
    preOper = sender.restorationIdentifier;
    isSelectedOperator = true;
    isReadyToInputNewValue = true;
}

- (IBAction) clickClear: (UIButton *) sender {
    
    isReadyToReplay = false;
    isSelectedOperator = false;
    isReadyToInputNewValue = true;
    
    [calculator initMemberVar];
    valueLabel.text = @"0";
    preOper = @"";
}

- (IBAction) clickEqual: (UIButton *) sender {
    if(!isReadyToReplay) calculator.currentValue = [valueLabel.text intValue];
    
    [calculator calculate:preOper];
    valueLabel.text = [NSString stringWithFormat:@"%i", calculator.resultValue];
 
    isReadyToReplay = true;
    isSelectedOperator  = false;
    isReadyToInputNewValue = true;
}

@end
