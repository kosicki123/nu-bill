//
//  NBModelConverter.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBModelConverter : NSObject

+ (id)convertModelFromJSON:(NSDictionary *)JSON class:(Class)classToParse;
+ (NSArray *)convertModelsFromJSON:(NSArray *)JSON class:(Class)classToParse;

@end
