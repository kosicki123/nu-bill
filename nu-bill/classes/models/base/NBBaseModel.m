//
//  NBBaseModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseModel.h"
#import "NBDateConverter.h"
#import <Mantle/MTLValueTransformer.h>

@implementation NBBaseModel

+ (NSValueTransformer *)dateValueTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSDate *(NSString *string, BOOL *success, NSError *__autoreleasing *error) {
        NSDate *date = [NBDateConverter dateFromString:string];
        return date;
    } reverseBlock:^NSString *(NSDate *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NBDateConverter stringFromDate:value];
    }];
}

+ (NSValueTransformer *)hundredMultiplierJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^NSNumber *(NSString *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSNumber numberWithDouble:value.doubleValue/100.f];
    } reverseBlock:^NSString *(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
        return [NSString stringWithFormat:@"%.0f", value.doubleValue*100];
    }];
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

@end
