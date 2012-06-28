//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Tom-Eric Gerritsen on 6/28/12.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;
@end
