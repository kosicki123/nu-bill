//
//  NBNuBankClientTests.m
//  nu-bill
//
//  Created by easytaxi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBNuBankClient.h"

@interface NBNuBankClientTests : XCTestCase

@end

@implementation NBNuBankClientTests

- (void)testAsynchronousURLConnection {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should be able to make requests"];
    NSString *path = @"bill/bill_new.json";
    NSURLSessionDataTask *task = [[NBNuBankClient sharedClient] GET:path
                                                         parameters:nil
                                                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                                                XCTAssertNotNil(responseObject, "Should not have nil response");
                                                                
                                                                NSURLResponse *response = task.response;
                                                                if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                                                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                                                                    XCTAssertEqual(200, httpResponse.statusCode, @"Should have 200 status code response");
                                                                    
                                                                    NSString *url = httpResponse.URL.absoluteString;
                                                                    BOOL containsURLClient = [url rangeOfString:NBNuBankClientURL].location != NSNotFound;
                                                                    XCTAssertTrue(containsURLClient, @"Should request to the right URL");
                                                                    
                                                                    BOOL containsPath = [url rangeOfString:path].location != NSNotFound;
                                                                    XCTAssertTrue(containsPath, @"Should contains path when requesting");
                                                                    
                                                                    XCTAssertEqualObjects(httpResponse.MIMEType, @"application/json", @"Should have right MIMEType when requesting");
                                                                } else {
                                                                    XCTFail(@"Response was not NSHTTPURLResponse");
                                                                }
                                                                
                                                                [expectation fulfill];
                                                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                                XCTFail(@"Should not fail when requesting");
                                                            }];
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
}
@end
