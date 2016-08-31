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
    int resultValue;
    int currentValue;
}

@property int resultValue, currentValue;

-(void) initMemberVar;
-(void) calculate: (NSString*) oper;

@end

#endif /* Calculator_h */
