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
    BOOL isReadyToInputNewValue; // 숫자를 새로 입력할 때 라벨에 0 이 있을 때 지우고 작성하기 위해서
    BOOL isReadyToReplay; // equal 연속으로 클릭했을 때
    BOOL isSelectedOperator; // 연산자 연속으로 클릭했을 때
}

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

- (IBAction)clickNumber:(UIButton *)sender;
- (IBAction)clickOperator:(UIButton *)sender;
- (IBAction)clickClear:(UIButton *)sender;
- (IBAction)clickEqual:(UIButton *)sender;

@end

