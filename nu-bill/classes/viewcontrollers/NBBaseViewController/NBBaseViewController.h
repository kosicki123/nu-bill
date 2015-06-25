//
//  NBBaseViewController.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NBBaseViewController : UIViewController

- (void)dismissHud;
- (void)dismissHudOnView:(UIView *)view;
- (MBProgressHUD *)showLoadingMessage:(NSString *)message;
- (MBProgressHUD *)showLoadingMessage:(NSString *)message inView:(UIView *)view;

- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage;
- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage inView:(UIView *)view;
- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage inView:(UIView *)view compeltitionBlock:(MBProgressHUDCompletionBlock)completition;

- (MBProgressHUD *)showHudWithCustomView:(UIView *)customView
                                  inView:(UIView *)view
                             withMessage:(NSString *)message
                       compeltitionBlock:(MBProgressHUDCompletionBlock)completition;

- (void)presentError:(NSError *)error inView:(UIView *)view;

@end
