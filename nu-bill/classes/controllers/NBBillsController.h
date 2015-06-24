//
//  NBBillsController.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NBConnectionBlocks.h"

@interface NBBillsController : NSObject

+ (NSURLSessionTask *)loadBillsWithCompletionBlock:(NBArrayCompletionBlock)completionBlock;

@end
