# CustomNumberKeyboard
#You Can use this Keyboard place any where on Viewcontroller
#How to use This
   
   
    
    -(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NumberKeyboard *numberKeyboard = [[NumberKeyboard alloc] init];
    numberKeyboard.delegate=(id)self;
    numberKeyboard.textField = textField;
    numberKeyboard.maxlength = 4;
    [numberKeyboard setMaxDecimalPoint:2];
    numberKeyboard.textField.inputView = [UIView new];
    if(IS_OS_9_OR_LATER)
    {
        numberKeyboard.textField.inputAssistantItem.leadingBarButtonGroups = @[];
        numberKeyboard.textField.inputAssistantItem.trailingBarButtonGroups = @[];
    }
    numberKeyboard.alpha = 1;
    numberKeyboard.showsPeriod = NO;
    if (!_keyboardAppear) {
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransition;
        [transition setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [numberKeyboard.layer addAnimation:transition forKey:nil];
        
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            [numberKeyboard presentNumberKeyboard:self.superview.superview.superview];
        }
        else{
            [numberKeyboard presentNumberKeyboard:self.superview.superview.superview];
        }
        _keyboardAppear = YES;
        
    }
    }
    
    
    

