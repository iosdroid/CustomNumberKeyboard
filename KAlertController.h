//
// WPSAlertController.h
//
// Created by Muthupalaniappan S.
// Copyright 2015 White Peak Software. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 `WPSAlertController` is a replacement for the deprecated `UIAlertView`. With `WPSAlertController`, you can display an alert without using a view controller.
 */
@interface KAlertController : UIAlertController

/**
 Show the alert view.
 
 This is the same as calling `showAnimated:YES`;
 */
- (void)show;

/**
 Show the alert view.
 
 @param animated Set to `YES` to animate the alert display.
 */
- (void)showAnimated:(BOOL)animated;

/**
 Displays an alert with an OK button.
 
 @param title The title of the alert. Use this string to get the user’s attention and communicate the reason for the alert.
 @param message Descriptive text that provides additional details about the reason for the alert.
 */
+ (void)presentOkayAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message;

/**
 Displays the `localizedDescription` of the provided error in an alert.
 
 @param error The error to display.
 */
+ (void)presentOkayAlertWithError:(nullable NSError *)error;

@end
