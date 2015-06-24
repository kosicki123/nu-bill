//
//  NBDateConverter.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBDateConverter.h"
#import "ISO8601DateFormatter.h"

@implementation NBDateConverter

+ (NSString *)stringFromDate:(NSDate *)date {
    return [[self formatter] stringFromDate:date];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [[self formatter] dateFromString:string];
}


#pragma mark - private methods

+ (ISO8601DateFormatter *)formatter {
    static ISO8601DateFormatter *_formatter;
    
    if (!_formatter) {
        _formatter = [[ISO8601DateFormatter alloc] init];
    }
    
    return _formatter;
}

@end
