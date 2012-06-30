//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Tom-Eric Gerritsen on 6/28/12.
//
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize history = _history;
@synthesize periodButton = _periodButton;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain {
    if (!_brain) {
        _brain = [[CalculatorBrain alloc] init];
    }
    
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
        
        // If the digit pressed is a period, disable that button
        if ([@"." isEqualToString:digit]) {
            self.periodButton.enabled = NO;
        }
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
        self.periodButton.enabled = YES;
    }
}

- (IBAction)clearPressed {
    [self.brain clear];
    self.display.text = @"0";
    self.history.text = @"";
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.periodButton.enabled = NO;
}

- (IBAction)backspacePressed {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        if ([self.display.text length] == 1) {
            self.display.text = @"0";
            self.userIsInTheMiddleOfEnteringANumber = NO;
        } else {
            self.display.text = [self.display.text substringToIndex:[self.display.text length] - 1];
        }
    }
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    
    self.history.text = [self.history.text stringByAppendingFormat:@" %@", sender.currentTitle];
    
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g =", result];
    self.display.text = resultString;
}

- (IBAction)enterPressed {
    double value = [self.display.text doubleValue];
    
    [self.brain pushOperand:value];
    
    self.history.text = [self.history.text stringByAppendingFormat:@" %g", value];
    self.display.text = [NSString stringWithFormat:@"%g", value];
    
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.periodButton.enabled = NO;
}

@end
