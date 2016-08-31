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
    BOOL isReadyToInputNewValue;
    BOOL isReadyToReplay;
    BOOL isSelectedOperator;
}

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

- (IBAction)clickNumber:(UIButton *)sender;
- (IBAction)clickOperator:(UIButton *)sender;
- (IBAction)clickClear:(UIButton *)sender;
- (IBAction)clickEqual:(UIButton *)sender;

@end

