//
//  NBBillItem.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillItem.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>


@implementation NBBillItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"postDate" : @"post_date",
             @"amount" : @"amount",
             @"title" : @"title",
             @"index" : @"index",
             @"charges" : @"charges",
             @"href" : @"href"};
}

+ (NSValueTransformer *)postDateJSONTransformer {
    return [self dateValueTransformer];
}

+ (NSValueTransformer *)hrefJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)amountJSONTransformer {
    return [self hundredMultiplierJSONTransformer];
}

@end
