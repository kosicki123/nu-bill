//
//  NBColors.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBColors.h"

@implementation NBColors

+ (UIColor *)overdueBillColor {
    return [UIColor colorWithRed:126.f/255.f green:211.f/255.f blue:33.f/255.f alpha:1.0f];
}

+ (UIColor *)closedBillColor {
    return [UIColor colorWithRed:229.f/255.f green:97.f/255.f blue:92.f/255.f alpha:1.0f];
}

+ (UIColor *)openBillColor {
    return [UIColor colorWithRed:64.f/255.f green:170.f/255.f blue:185.f/255.f alpha:1.0f];
}

+ (UIColor *)futureBillColor {
    return [UIColor colorWithRed:245.f/255.f green:166.f/255.f blue:35.f/255.f alpha:1.0f];
}

+ (UIColor *)grayColor {
    return [UIColor colorWithRed:247.f/255.f green:247.f/255.f blue:247.f/255.f alpha:1.0f];
}

+ (UIColor *)lightGreenColor {
    return [UIColor colorWithRed:139.f/255.f green:195.f/255.f blue:74.f/255.f alpha:1.0f];
}

@end
