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

@synthesize oper;
@synthesize firstVal, secondVal, resultVal;
@synthesize hasSecondVal;

- (void) initCalculate {
    firstVal = 0;
    secondVal = 0;
    resultVal = 0;
    oper = nil;
    hasSecondVal = false;
}

- (void) calculate {
    
    if (!hasSecondVal) {
        secondVal = firstVal;
        hasSecondVal = true;
    }
    
    if([oper isEqualToString:@"plus"]) {
        resultVal = firstVal + secondVal;
        
    } else if([oper isEqualToString:@"minus"]) {
        resultVal = firstVal - secondVal;
        
    } else if([oper isEqualToString:@"multiply"]) {
        resultVal = firstVal * secondVal;
        
    } else if([oper isEqualToString:@"divide"]) {
        resultVal = firstVal / secondVal;
        
    } else if([oper isEqualToString:@"mod"]) {
        resultVal = firstVal % secondVal;
    }
}

@end
