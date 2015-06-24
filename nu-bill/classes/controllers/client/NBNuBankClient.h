//
//  NBNuBankClient.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "AFHTTPSessionManager.h"

extern NSString *NBNuBankClientURL;

@interface NBNuBankClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
