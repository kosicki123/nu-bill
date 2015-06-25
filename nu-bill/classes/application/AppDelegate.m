//
//  AppDelegate.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "AppDelegate.h"
#import "NBBillsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NBBillsViewController *billsViewController = [[NBBillsViewController alloc] init];
    self.window.rootViewController = billsViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
