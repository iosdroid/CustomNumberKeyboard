//
//  NumberKeyboard.m
//  CustKeypad
//
//  Created by Muthupalaniappan on 1/12/16.
//  Copyright © 2016 Muthupalaniappan. All rights reserved.
//

#import "NumberKeyboard.h"
#import "KAlertController.h"
#import "NewOutletHelper.h"
@implementation NumberKeyboard
@synthesize textField = _textField;
@synthesize maxlength, maxDecimalPoint;

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (id)init {
    
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NumberKeyboard" owner:self options:nil];
        
        self = [nib objectAtIndex:0];
    }
    
    
    [keyOne setBackgroundImage:[[keyOne backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyTwo setBackgroundImage:[[keyTwo backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyThree setBackgroundImage:[[keyThree backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyFour setBackgroundImage:[[keyFour backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyFive setBackgroundImage:[[keyFive backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keySix setBackgroundImage:[[keySix backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keySeven setBackgroundImage:[[keySeven backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyEight setBackgroundImage:[[keyEight backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyNine setBackgroundImage:[[keyNine backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyZero setBackgroundImage:[[keyZero backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyPeriod setBackgroundImage:[[keyPeriod backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyBack setBackgroundImage:[[keyBack backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    [keyBack setBackgroundImage:[[keyReturn backgroundImageForState:UIControlStateNormal] stretchableImageWithLeftCapWidth:8 topCapHeight:50] forState:UIControlStateNormal];
    
    
    return self;
}

- (IBAction)keyPressed:(UIButton *)sender {
    
    if ([self.textField.text isEqualToString:@"0"] || [self.textField.text isEqualToString:@"0.00"]) {
        self.textField.text = @"";
    }
    self.textField.text = [self.textField.text stringByAppendingString:sender.titleLabel.text];
    
    
    if (![[self.textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] ) {
        [self.textField setText:@""];
    }
    else if(self.textField.text.length>=maxlength && (maxlength != -1)){
        NSArray *countArr=[self.textField.text componentsSeparatedByString:@"."];
        
        if ([countArr count]>1) {
            if ([[countArr objectAtIndex:1] length]>maxDecimalPoint) {
                self.textField.text = [ self.textField.text substringToIndex:[ self.textField.text length] - 1];
                [KAlertController presentOkayAlertWithTitle:EMPTYSTRING message:[LocalizationHandler getLocalisedStringFromString:keyboard_allowupto_two_decimal_points] ];
                
                if ([[CommonHelper getActivityCode]isEqualToString:MENU_SOS] && [SOSHelper isBlockEnable]) {
                    self.textField.text=@"0";
                }
            }
            
        }else if([countArr count]==1){
            if ([[countArr objectAtIndex:0] length]>maxlength  ) {
                self.textField.text = [ self.textField.text substringToIndex:[ self.textField.text length] - 1];
                
                [KAlertController presentOkayAlertWithTitle:EMPTYSTRING message:[LocalizationHandler getLocalisedStringFromString:Exceeds_the_limit] ];
                
                
                if ([[CommonHelper getActivityCode]isEqualToString:MENU_SOS] && [SOSHelper isBlockEnable]) {
                    self.textField.text=@"0";
                }
            }
            
        }
        
        
    }
    
//    else if(self.textField.text.length>maxlength && (maxlength != -1))
//    {
//        self.textField.text=@"";
//        
//        [KAlertController presentOkayAlertWithTitle:EMPTYSTRING message:[LocalizationHandler getLocalisedStringFromString:Exceeds_the_limit] ];
//        
//        
//        if ([[CommonHelper getActivityCode]isEqualToString:MENU_SOS] && [SOSHelper isBlockEnable]) {
//            self.textField.text=@"0";
//        }
//    }
    
    
    if([self.delegate respondsToSelector:@selector(textfieldStringChange:forTextfield:)])
        [self.delegate textfieldStringChange:self.textField.text forTextfield:self.textField];
}

- (IBAction)periodToggled:(id)sender
{
   
    if(!self.textField.text || [self.textField.text isEqualToString:@""])
        self.textField.text = @"0";
    
    if([self.textField.text isEqualToString:@"-"])
        self.textField.text = @"-0";
    
    if(![self.textField.text isEqualToString:@""] && ![[self.textField.text substringFromIndex:[self.textField.text length]-1] isEqualToString:@"."] && ![self.textField.text containsString:@"."])
    {
        NSString* txtFieldValue = [NSString stringWithFormat:@"%@.", self.textField.text];
        [self.textField setText:txtFieldValue];
        
    }
//        self.textField.text = [self.textField.text stringByReplacingOccurrencesOfString:@"." withString:@""];
//        self.textField.text = [self.textField.text stringByAppendingString:@"."];
//           
//    }
    
    
    if([self.delegate respondsToSelector:@selector(textfieldStringChange:forTextfield:)])
        [self.delegate textfieldStringChange:self.textField.text forTextfield:self.textField];
}

- (IBAction)backspacePressed:(id)sender
{
    if(self.textField.text.length <= 0)
    {
        self.textField.text = @"0";
        return;
    }
    if([self.textField.text floatValue] == 0)
    {
        self.textField.text = @"0";
        return;
    }
    
    self.textField.text = [self.textField.text substringToIndex:self.textField.text.length-1];
    
    if([self.textField.text length] <= 0)
    {
        self.textField.text = @"0";
    }
    if([self.delegate respondsToSelector:@selector(textfieldStringChange:forTextfield:)])
        [self.delegate textfieldStringChange:self.textField.text forTextfield:self.textField];
    
    
}

- (IBAction)returnPressed:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(keypadDone)]) {
        [self.delegate keypadDone];
    }
    [self.textField resignFirstResponder];
}

- (IBAction)nextPressed:(UIButton *)sender {
    [self.textField.delegate textFieldShouldReturn:self.textField];
    
    
}


-(void)presentNumberKeyboard:(UIView *)parentView{
    [parentView addSubview:self];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *keyboardYconstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY
                                                                           relatedBy:NSLayoutRelationEqual toItem:parentView attribute:
                                               NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f];
    
    
    NSLayoutConstraint *keyboardTrailingConstraint = [NSLayoutConstraint constraintWithItem:parentView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0.0f];
    
    NSLayoutConstraint *keyboardWidthConstraint =[NSLayoutConstraint constraintWithItem:self
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:250];
    NSLayoutConstraint *keyboardHeightConstraint =[NSLayoutConstraint constraintWithItem:self
                                                                               attribute:NSLayoutAttributeHeight
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:nil
                                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                                              multiplier:1.0
                                                                                constant:290];
    [self addConstraints:@[keyboardWidthConstraint,keyboardHeightConstraint]];
    
    [parentView addConstraints:@[keyboardYconstraint,keyboardTrailingConstraint]];
}


@end
