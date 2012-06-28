//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Tom-Eric Gerritsen on 6/28/12.
//
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *history;
@property (weak, nonatomic) IBOutlet UIButton *periodButton;

@end
