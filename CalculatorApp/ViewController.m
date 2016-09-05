//
//  ViewController.m
//  CalculatorApp
//
//  Created by ios on 2016. 8. 30..
//  Copyright © 2016년 ios. All rights reserved.
//

#import "ViewController.h"

#define INPUT_FIRSTVAL 1
#define INPUT_SECONDVAL 2
#define INPUT_OPERATOR 3
#define INPUT_EQUAL 4
#define INPUT_CLEAR 5

@interface ViewController ()

@end

@implementation ViewController

@synthesize valueLabel;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    myCal = [[Calculator alloc] init];
    [self clearCalculator];
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction) clickNumber: (UIButton *) sender {

    if(lastInputType == INPUT_EQUAL || lastInputType == INPUT_OPERATOR || [valueLabel.text isEqualToString:@"0"]){
        valueLabel.text = @"";
    }
    
    valueLabel.text = [valueLabel.text stringByAppendingString:[NSString stringWithFormat:@"%li", sender.tag]];
    
    if (lastInputType == INPUT_CLEAR || lastInputType == INPUT_EQUAL || lastInputType == INPUT_FIRSTVAL) {
        myCal.firstVal = [valueLabel.text intValue];
        lastInputType = INPUT_FIRSTVAL;
    }
    if (lastInputType == INPUT_OPERATOR || lastInputType == INPUT_SECONDVAL) {
        myCal.secondVal = [valueLabel.text intValue];
        lastInputType = INPUT_SECONDVAL;
        myCal.hasSecondVal = true;
    }
}

- (IBAction)clickOperator:(UIButton *)sender{
    
    if(lastInputType == INPUT_CLEAR || lastInputType == INPUT_OPERATOR) return;
    if (lastInputType == INPUT_EQUAL) {
        lastInputType = INPUT_FIRSTVAL;
    }
    
    if (lastInputType == INPUT_FIRSTVAL) {
        myCal.oper = sender.restorationIdentifier;
    }
    
    if(lastInputType == INPUT_SECONDVAL) {
        [myCal calculate];
        valueLabel.text = [NSString stringWithFormat:@"%i", myCal.resultVal];
        myCal.firstVal = [valueLabel.text intValue];
        myCal.oper = sender.restorationIdentifier;
    }
    
    lastInputType = INPUT_OPERATOR;
}

- (IBAction) clickEqual: (UIButton *) sender {

    if (lastInputType == INPUT_FIRSTVAL && myCal.hasSecondVal == false) return;
    if (lastInputType == INPUT_CLEAR) return;
    
    [myCal calculate];
    valueLabel.text = [NSString stringWithFormat:@"%i", myCal.resultVal];
    myCal.firstVal = [valueLabel.text intValue];
    
    lastInputType = INPUT_EQUAL;
}

- (IBAction) clickClear: (UIButton *) sender {
    
    [self clearCalculator];
}

- (void) clearCalculator {
    [myCal initCalculate];
    lastInputType = INPUT_CLEAR;
    valueLabel.text = @"0";
}

@end