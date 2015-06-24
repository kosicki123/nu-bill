//
//  NBBillResult.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillResult.h"
#import <BlocksKit/NSArray+BlocksKit.h>

@implementation NBBillResult

#pragma mark - mantle methods

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"bill" : @"bill"};
}

+ (NSValueTransformer *)billJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:[NBBill class]];
}

#pragma mark - public methods

+ (NSArray *)extractBillsFromResults:(NSArray *)billResults {
    if (!billResults || billResults.count == 0) {
        return @[];
    }
    
    return [billResults bk_map:^NBBill *(NBBillResult *result) {
        return result.bill;
    }];
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)other {
    if (other == self)
        return YES;
    if (!other || ![[other class] isEqual:[self class]])
        return NO;
    
    return [self isEqualToBillResult:other];
}

- (BOOL)isEqualToBillResult:(NBBillResult *)billResult {
    if (self == billResult)
        return YES;
    if (billResult == nil)
        return NO;
    if (self.bill != billResult.bill && ![self.bill isEqualToBill:billResult.bill])
        return NO;
    return YES;
}

- (NSUInteger)hash {
    return [self.bill hash];
}

@end
