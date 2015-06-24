//
//  NBNuBankClient.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBNuBankClient.h"
#import "AFNetworkActivityIndicatorManager.h"

NSString *NBNuBankClientURL = @"https://s3-sa-east-1.amazonaws.com/mobile-challenge";

@implementation NBNuBankClient

+ (instancetype)sharedClient {
    static NBNuBankClient * _sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[NBNuBankClient alloc] initWithBaseURL:[NSURL URLWithString:NBNuBankClientURL]];
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    });
    
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableContainers];
    }
    
    return self;
}

@end
