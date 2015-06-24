//
//  NBBillsControllerTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBillsController.h"

@interface NBBillsControllerTests : XCTestCase

@end

@implementation NBBillsControllerTests

- (void)testShouldResturnBillErrorWhen4xxStatusCodeIsReturned {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return invalid error request for error 4xx"];
    NSURLSessionTask *task = [NBBillsController loadBillsWithCompletionBlock:^(NSArray *array, NSError *error) {
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
    
}

@end
