//
//  Calculator.h
//  CalculatorApp
//
//  Created by ios on 2016. 8. 31..
//  Copyright © 2016년 ios. All rights reserved.
//

#ifndef Calculator_h
#define Calculator_h

@interface Calculator : NSObject {
    
    NSString *oper;
    int firstVal;
    int secondVal;
    int resultVal;
    BOOL hasSecondVal;
}

@property NSString* oper;
@property int firstVal, secondVal, resultVal;
@property BOOL hasSecondVal;

-(void) initCalculate;
-(void) calculate;

@end

#endif /* Calculator_h */
