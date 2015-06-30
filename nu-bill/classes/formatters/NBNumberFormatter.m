//
//  NBNumberFormatter.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBNumberFormatter.h"

@implementation NBNumberFormatter

+ (NSString *)stringFromNumber:(NSNumber *)number {
    static NSNumberFormatter *numberFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"pt_BR"]];
        [numberFormatter setMinimumFractionDigits:2];
        [numberFormatter setMaximumFractionDigits:2];
    });
    return [numberFormatter stringFromNumber:number];
}

+ (NSString *)currencyStringFromNumber:(NSNumber *)number {
    static NSNumberFormatter *numberFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setGroupingSize:3];
        [numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"pt_BR"]];
        [numberFormatter setMinimumFractionDigits:2];
        [numberFormatter setMaximumFractionDigits:2];
    });
    return [numberFormatter stringFromNumber:number];
}

@end
