//
//  NBDateFormatter.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBDateFormatter : NSObject

+ (NSString *)monthForDate:(NSDate *)date;
+ (NSNumber *)dayOfDate:(NSDate *)date;

@end
