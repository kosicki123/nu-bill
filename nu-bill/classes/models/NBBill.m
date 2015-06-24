//
//  NBBill.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBill.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>

@implementation NBBill

#pragma mark - mantle methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"billId" : @"id",
             @"state" : @"state",
             @"barcode" : @"barcode",
             @"writableBarcode" : @"linha_digitavel",
             @"items" : @"items",
             @"summary" : @"summary"};
}

+ (NSValueTransformer *)summaryJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[NBSummary class]];
}

+ (NSValueTransformer *)stateJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{@"overdue" : @(NBBillStateOverdue),
                                                                           @"closed" : @(NBBillStateClosed),
                                                                           @"open" : @(NBBillStateOpen),
                                                                           @"future" : @(NBBillStateFuture)}];
}

+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[NBBillItem class]];
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    
    return [self isEqualToBill:other];
}

- (BOOL)isEqualToBill:(NBBill *)bill {
    if (self == bill)
        return YES;
    if (bill == nil)
        return NO;
    if (self.billId != bill.billId && ![self.billId isEqualToString:bill.billId])
        return NO;
    return YES;
}

- (NSUInteger)hash {
    return [self.billId hash];
}

@end
