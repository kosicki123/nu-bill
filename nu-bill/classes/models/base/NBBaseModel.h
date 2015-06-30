//
//  NBBaseModel.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface NBBaseModel : MTLModel <MTLJSONSerializing>

+ (NSValueTransformer *)dateValueTransformer;
+ (NSValueTransformer *)hundredMultiplierJSONTransformer;

@end
