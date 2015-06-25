//
//  NBColors.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NBColors : NSObject

+ (UIColor *)overdueBillColor;
+ (UIColor *)closedBillColor;
+ (UIColor *)openBillColor;
+ (UIColor *)futureBillColor;

+ (UIColor *)grayColor;
+ (UIColor *)lightGreenColor;

@end
