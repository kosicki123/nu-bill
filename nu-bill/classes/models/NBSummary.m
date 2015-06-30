//
//  NBSummary.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBSummary.h"

@implementation NBSummary

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"dueDate" : @"due_date",
             @"closeDate" : @"close_date",
             @"pastBalance" : @"past_balance",
             @"totalBalance" : @"total_balance",
             @"interest" : @"interest",
             @"totalCumulative" : @"total_cumulative",
             @"paid" : @"paid",
             @"minimumPayment" : @"minimum_payment",
             @"openDate" : @"open_date"};
}

+ (NSValueTransformer *)dueDateJSONTransformer {
    return [self dateValueTransformer];
}

+ (NSValueTransformer *)closeDateJSONTransformer {
    return [self dateValueTransformer];
}

+ (NSValueTransformer *)openDateJSONTransformer {
    return [self dateValueTransformer];
}

+ (NSValueTransformer *)postBalanceJSONTransformer {
    return [self hundredMultiplierJSONTransformer];
}

+ (NSValueTransformer *)totalBalanceJSONTransformer {
    return [self hundredMultiplierJSONTransformer];
}

+ (NSValueTransformer *)totalCumulativeJSONTransformer {
    return [self hundredMultiplierJSONTransformer];
}

+ (NSValueTransformer *)paidJSONTransformer {
    return [self hundredMultiplierJSONTransformer];
}

+ (NSValueTransformer *)minimumPaymentJSONTransformer {
    return [self hundredMultiplierJSONTransformer];
}

@end
