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
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)clickNumber:(UIButton *)sender {
    if(isInputNewValue || [valueLabel.text isEqualToString:@"0"]) {
        valueLabel.text = @"";
    }
    isInputNewValue = false;
    valueLabel.text = [valueLabel.text stringByAppendingFormat:[NSString stringWithFormat:@"%li", sender.tag],nil];
}

- (IBAction)clickOperator:(UIButton *)sender{
    
    if ([sender.restorationIdentifier isEqualToString:@"clear"]) {
        [calculator initMemberVar];
        valueLabel.text = @"0";
        return;
    }
    calculator.currentValue = [valueLabel.text intValue];
    [calculator calculate:preOper];
    valueLabel.text = [NSString stringWithFormat:@"%i", calculator.resultValue];
    preOper = sender.restorationIdentifier;
    isInputNewValue = true;
}

@end
