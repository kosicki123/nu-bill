//
//  NBBillsController.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillsController.h"
#import "NBNuBankClient.h"

#import "NBModelConverter.h"
#import "NBBillResult.h"

NSString *NBBillsControllerErrorDomain = @"br.com.nubank:NBBillsControllerErrorDomain";

@implementation NBBillsController

+ (NSURLSessionTask *)loadBillsWithCompletionBlock:(NBArrayCompletionBlock)completionBlock {
    return [[NBNuBankClient sharedClient] GET:@"bill/bill_new.json"
                                   parameters:nil
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                          NSArray *billResults = [NBModelConverter convertModelsFromJSON:responseObject
                                                                                                   class:[NBBillResult class]];
                                          NSArray *bills = [NBBillResult extractBillsFromResults:billResults];
                                          if (completionBlock) completionBlock(bills, nil);
                                      } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                          if ([error.domain isEqualToString:NSURLErrorDomain]) {
                                              
                                              error = [self buildConnectionProblemError];
                                              if (completionBlock) completionBlock(nil, error);
                                              return;
                                          }
                                          
                                          NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                                          if (response.statusCode >= 400 && response.statusCode <= 499) {
                                              error = [self build400Error];
                                          }
                                          if (response.statusCode >= 500 && response.statusCode <= 599) {
                                              error = [self build500Error];
                                          }
                                          
                                          if (completionBlock) completionBlock(nil, error);
                                      }];
}

#pragma mark - private methods

+ (NSError *)buildConnectionProblemError {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : NSLocalizedString(@"Parece que você está sem internet! Por favor, verifique a sua conexão e tente novamente.", nil)};
    
    return [NSError errorWithDomain:NBBillsControllerErrorDomain
                               code:NBBillsControllerErrorCodeConnectionProblem
                           userInfo:userInfo];
}

+ (NSError *)build400Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey : NSLocalizedString(@"Houve algum erro com o seu pedido.", nil)};
    
    return [NSError errorWithDomain:NBBillsControllerErrorDomain
                               code:NBBillsControllerErrorCodeBadRequest
                           userInfo:userInfo];
}

+ (NSError *)build500Error {
    NSDictionary *userInfo =
    @{NSLocalizedDescriptionKey :
          NSLocalizedString(@"Desculpe, estamos enfrentando problemas técnicos. Por favor, tente novamente mais tarde.", nil)};
    
    return [NSError errorWithDomain:NBBillsControllerErrorDomain
                               code:NBBillsControllerErrorCodeServerError
                           userInfo:userInfo];
}

@end
