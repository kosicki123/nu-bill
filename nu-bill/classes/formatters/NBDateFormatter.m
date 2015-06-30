//
//  NBDateFormatter.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBDateFormatter.h"

@implementation NBDateFormatter

+ (NSString *)mediumMonthForDate:(NSDate *)date {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"pt_BR"];
        dateFormatter.dateFormat = @"MMM";
    });
    
    return [[dateFormatter stringFromDate:date] uppercaseString];
}

+ (NSString *)longMonthForDate:(NSDate *)date {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"pt_BR"];
        dateFormatter.dateFormat = @"MMMM";
    });
    
    return [[dateFormatter stringFromDate:date] uppercaseString];
}

+ (NSNumber *)dayOfDate:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *dayComponents =
        [gregorian components:NSCalendarUnitDay fromDate:date];
    NSInteger day = [dayComponents day];
    return @(day);
}

@end
