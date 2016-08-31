//
//  Calculator.m
//  CalculatorApp
//
//  Created by ios on 2016. 8. 31..
//  Copyright © 2016년 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

@implementation Calculator

-(void) init {
    resultValue = 0;
    currentValue = 0;
}

-(void) calculate: (char) oper {
    switch (oper) {
        case '+':
            resultValue = resultValue + currentValue;
            break;
        case '-':
            resultValue = resultValue - currentValue;
            break;
        case '*':
            resultValue = resultValue * currentValue;
            break;
        case '/':
            resultValue = resultValue / currentValue;
            break;
        case '%':
            resultValue = resultValue % currentValue;
            break;
        default:
            break;
    }
}

@end
