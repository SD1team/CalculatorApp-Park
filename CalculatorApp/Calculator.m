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

@synthesize resultValue, currentValue;

- (void) initMemberVar {
    resultValue = 0;
    currentValue = 0;
}

- (void) calculate: (NSString*) oper {
    
    if([oper isEqualToString:@"plus"]) {
        resultValue = resultValue + currentValue;
        
    } else if([oper isEqualToString:@"minus"]) {
        resultValue = resultValue - currentValue;
        
    } else if([oper isEqualToString:@"multiply"]) {
        resultValue = resultValue * currentValue;
        
    } else if([oper isEqualToString:@"divide"]) {
        resultValue = resultValue / currentValue;
        
    } else if([oper isEqualToString:@"mod"]) {
        resultValue = resultValue % currentValue;
    } else {
        resultValue = currentValue;
    }
}

@end
