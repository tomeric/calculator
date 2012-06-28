//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Tom-Eric Gerritsen on 6/28/12.
//
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
- (double)popOperand;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
    if (!_operandStack) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    
    return _operandStack;
}

- (void)clear {
    [self.operandStack removeAllObjects];
}

- (void)pushOperand:(double)operand {
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand {
    NSNumber *operand = [self.operandStack lastObject];
    
    if (operand) {
        [self.operandStack removeLastObject];
    }
    
    return [operand doubleValue];
}

- (double)performOperation:(NSString *)operation {
    double result = 0;
    
    if ([@"+" isEqualToString:operation]) {
        result = [self popOperand] + [self popOperand];
    } else if ([@"-" isEqualToString:operation]) {
        double substraction = [self popOperand];
        result = [self popOperand] - substraction;
    } else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand] * [self popOperand];
    } else if ([@"/" isEqualToString:operation]) {
        double divider = [self popOperand];
        result = [self popOperand] / divider;
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
