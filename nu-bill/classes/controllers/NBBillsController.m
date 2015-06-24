//
//  NBBillsController.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillsController.h"
#import "NBNuBankClient.h"

@implementation NBBillsController

+ (NSURLSessionTask *)loadBillsWithCompletionBlock:(NBArrayCompletionBlock)completionBlock {
    return [[NBNuBankClient sharedClient] GET:@"bill/bill_new.json"
                                   parameters:nil
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                          NSLog(@"%@", responseObject);
                                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                          NSLog(@"%@", error);
                                      }];
}

@end
