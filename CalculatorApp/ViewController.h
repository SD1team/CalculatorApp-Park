//
//  ViewController.h
//  CalculatorApp
//
//  Created by ios on 2016. 8. 30..
//  Copyright © 2016년 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface ViewController : UIViewController {
    
    Calculator *calculator;
    NSString *preOper;
    int lastInputType;
}

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

- (IBAction)clickNumber:(UIButton *)sender;
- (IBAction)clickOperator:(UIButton *)sender;
- (IBAction)clickEqual:(UIButton *)sender;
- (IBAction)clickClear:(UIButton *)sender;

- (void) clearCalculator;

@end

