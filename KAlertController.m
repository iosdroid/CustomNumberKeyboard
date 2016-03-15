//
// WPSAlertController.h
//
// Created by Muthupalaniappan S.
// Copyright 2015 White Peak Software. All rights reserved.
//

#import "KAlertController.h"

@interface KAlertController ()
@property (nonatomic, strong) UIWindow *alertWindow;
@end

@implementation KAlertController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
  [[self alertWindow] setHidden:YES];
  [self setAlertWindow:nil];
}

- (void)show
{
  [self showAnimated:YES];
}

- (void)showAnimated:(BOOL)animated
{

  UIViewController *blankViewController = [[UIViewController alloc] init];

  [[blankViewController view] setBackgroundColor:[UIColor clearColor]];
  
  UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [window setRootViewController:blankViewController];
  [window setBackgroundColor:[UIColor clearColor]];
  [window setWindowLevel:UIWindowLevelAlert + 1];
  [window makeKeyAndVisible];
  [self setAlertWindow:window];
  
  [blankViewController presentViewController:self animated:animated completion:nil];
}

+ (void)presentOkayAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message
{
  KAlertController *alertController = [KAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *okayAction = [UIAlertAction actionWithTitle:NSLocalizedStringFromTable(@"OK", @"WPSKit", @"Alert button title") style:UIAlertActionStyleDefault handler:nil];
  [alertController addAction:okayAction];

  [alertController show];
}

+ (void)presentOkayAlertWithError:(nullable NSError *)error
{
  NSString *title = NSLocalizedStringFromTable(@"Error",  @"WPSKit", @"Alert title.");
  NSString *message = [error localizedDescription];
  [[self class] presentOkayAlertWithTitle:title message:message];
}

@end
