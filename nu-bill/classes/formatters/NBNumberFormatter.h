//
//  NBNumberFormatter.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBNumberFormatter : NSObject

+ (NSString *)stringFromNumber:(NSNumber *)number;
+ (NSString *)currencyStringFromNumber:(NSNumber *)number;

@end
