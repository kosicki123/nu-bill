//
//  NBModelConverter.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBModelConverter.h"
#import "MTLJSONAdapter.h"

@implementation NBModelConverter

+ (id)convertModelFromJSON:(NSDictionary *)JSON class:(Class)classToParse {
    NSParameterAssert(classToParse != nil);
    
    @try {
        NSError *error = nil;
        id object = [MTLJSONAdapter modelOfClass:classToParse
                              fromJSONDictionary:JSON
                                           error:&error];
        if (!error) {
            return object;
        } else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}

+ (NSArray *)convertModelsFromJSON:(NSArray *)JSON class:(Class)classToParse {
    NSParameterAssert(classToParse != nil);
    
    @try {
        NSError *error = nil;
        NSArray *objects = [MTLJSONAdapter modelsOfClass:classToParse
                                           fromJSONArray:JSON
                                                   error:&error];
        if (!error) {
            return objects;
        } else {
            return nil;
        }
    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
