//
//  NBConnectionBlocks.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

typedef void (^NBCompletionBlock)(NSError *error);

typedef void (^NBObjectCompletionBlock)(id object, NSError *error);

typedef void (^NBArrayCompletionBlock)(NSArray *array, NSError *error);
