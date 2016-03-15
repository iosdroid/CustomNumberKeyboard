//
//  NumberKeyboard.h
//  CustKeypad
//
//  Created by Muthupalaniappan on 1/12/16.
//  Copyright © 2016 Muthupalaniappan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Delegates.h"


@interface NumberKeyboard : UIView<Delegates>{
    IBOutlet UIButton *keyOne;
    IBOutlet UIButton *keyTwo;
    IBOutlet UIButton *keyThree;
    IBOutlet UIButton *keyFour;
    IBOutlet UIButton *keyFive;
    IBOutlet UIButton *keySix;
    IBOutlet UIButton *keySeven;
    IBOutlet UIButton *keyEight;
    IBOutlet UIButton *keyNine;
    IBOutlet UIButton *keyZero;
    IBOutlet UIButton *keyPeriod;
    IBOutlet UIButton *keyBack;
    IBOutlet UIButton *keyReturn;
    
    IBOutlet UIButton *keyNext;
}

@property(nonatomic)int maxDecimalPoint;

@property(nonatomic,assign)UIViewController<Delegates>*delegate;
@property (nonatomic, assign) UITextField *textField;
@property(nonatomic)int maxlength;
@property (nonatomic) BOOL showsPeriod, showsMinus;
- (IBAction)keyPressed:(UIButton *)sender;
- (IBAction)periodToggled:(UIButton*)sender;
- (IBAction)backspacePressed:(UIButton*)sender;
- (IBAction)returnPressed:(UIButton*)sender;
- (IBAction)nextPressed:(UIButton *)sender;
-(void)presentNumberKeyboard:(UIView *)parentView;

@end
