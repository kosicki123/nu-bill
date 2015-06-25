//
//  NBBaseViewController.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseViewController.h"
#import "NBBillsController.h"

@implementation NBBaseViewController

#pragma mark - loading methods

- (void)dismissHud {
    [self dismissHudOnView:self.view];
}

- (void)dismissHudOnView:(UIView *)view {
    view.userInteractionEnabled = YES;
    [MBProgressHUD hideAllHUDsForView:view
                             animated:YES];
}

- (MBProgressHUD *)showLoadingMessage:(NSString *)message {
    return [self showLoadingMessage:message inView:self.view];
}

- (MBProgressHUD *)showLoadingMessage:(NSString *)message inView:(UIView *)view {
    view.userInteractionEnabled = NO;
    NSArray *currentHuds = [MBProgressHUD allHUDsForView:view];
    if (currentHuds.count) {
        return [currentHuds lastObject];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view
                                              animated:YES];
    hud.labelText = message;
    
    return hud;
}

- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage {
    return [self showErrorMessage:errorMessage inView:self.view];
}

- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage inView:(UIView *)view {
    return [self showErrorMessage:errorMessage inView:view compeltitionBlock:nil];
}

- (MBProgressHUD *)showErrorMessage:(NSString *)errorMessage inView:(UIView *)view compeltitionBlock:(MBProgressHUDCompletionBlock)completition {
    return [self showHudWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error.png"]]
                                inView:view
                           withMessage:errorMessage
                     compeltitionBlock:completition];
}

- (MBProgressHUD *)showHudWithCustomView:(UIView *)customView inView:(UIView *)view withMessage:(NSString *)message
                       compeltitionBlock:(MBProgressHUDCompletionBlock)completition {
    [self dismissHudOnView:view];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view
                                              animated:YES];
    
    hud.labelText = message;
    hud.customView = customView;
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5f];
    if (completition) {
        [hud setCompletionBlock:completition];
    }
    
    return hud;
}

#pragma mark - public methods

- (void)presentError:(NSError *)error inView:(UIView *)view {
    [self showErrorMessage:error.localizedDescription inView:view];
}

@end
