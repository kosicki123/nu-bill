//
//  NBBillsControllerTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import <BlocksKit/NSArray+BlocksKit.h>
#import "OHHTTPStubs.h"
#import "NBBillsController.h"
#import "NBBillResult.h"
#import "NBBill.h"

@interface NBBillsControllerTests : XCTestCase

@end

@implementation NBBillsControllerTests

- (void)tearDown {
    [OHHTTPStubs removeAllStubs];
}

- (void)testShouldReturnBadRequestWhen4xxStatusCodeIsReturned {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"bill/bill_new.json"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithData:[NSData data] statusCode:400 headers:nil];
    }];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return invalid error request for error 4xx"];
    NSURLSessionTask *task = [NBBillsController loadBillsWithCompletionBlock:^(NSArray *array, NSError *error) {
        XCTAssertNil(array);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, NBBillsControllerErrorCodeBadRequest);
        XCTAssertEqualObjects(error.domain, NBBillsControllerErrorDomain);
        XCTAssertEqualObjects(error.userInfo[NSLocalizedDescriptionKey], NSLocalizedString(@"Houve algum erro com o seu pedido.", nil));
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
    
}

- (void)testShouldReturnServerErrorWhen5xxStatusCodeIsReturned {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"bill/bill_new.json"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithData:[NSData data] statusCode:500 headers:nil];
    }];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return invalid error request for error 5xx"];
    NSURLSessionTask *task = [NBBillsController loadBillsWithCompletionBlock:^(NSArray *array, NSError *error) {
        XCTAssertNil(array);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, NBBillsControllerErrorCodeServerError);
        XCTAssertEqualObjects(error.domain, NBBillsControllerErrorDomain);
        XCTAssertEqualObjects(error.userInfo[NSLocalizedDescriptionKey], NSLocalizedString(@"Desculpe, estamos enfrentando problemas técnicos. Por favor, tente novamente mais tarde.", nil));
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
    
}

- (void)testShouldReturnConnectionErrorWhenURLErrorDomainIsReturned {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"bill/bill_new.json"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        NSError *notConnectedError = [NSError errorWithDomain:NSURLErrorDomain
                                                         code:kCFURLErrorNotConnectedToInternet
                                                     userInfo:nil];
        return [OHHTTPStubsResponse responseWithError:notConnectedError];
    }];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should return connection error when not connected"];
    NSURLSessionTask *task = [NBBillsController loadBillsWithCompletionBlock:^(NSArray *array, NSError *error) {
        XCTAssertNil(array);
        XCTAssertNotNil(error);
        XCTAssertEqual(error.code, NBBillsControllerErrorCodeConnectionProblem);
        XCTAssertEqualObjects(error.domain, NBBillsControllerErrorDomain);
        XCTAssertEqualObjects(error.userInfo[NSLocalizedDescriptionKey], NSLocalizedString(@"Parece que você está sem internet! Por favor, verifique a sua conexão e tente novamente.", nil));
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
    
}

- (void)testShouldBeAbleToParseAndReturnBills {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return [request.URL.absoluteString rangeOfString:@"bill/bill_new.json"].location != NSNotFound;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"bill_new.json",self.class)
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"Should be able to parse and return bills"];
    NSURLSessionTask *task = [NBBillsController loadBillsWithCompletionBlock:^(NSArray *array, NSError *error) {
        XCTAssertNil(error, @"Should be able to parse bills without an error");
        XCTAssertEqual(4, array.count, @"Should be able to parse all 4 bills inside the fixture");
        [array bk_each:^(id obj) {
            XCTAssertTrue([obj isKindOfClass:[NBBill class]], @"Should have only NBBill objects inside response");
        }];
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:task.originalRequest.timeoutInterval handler:^(NSError *error) {
        [task cancel];
    }];
}

@end
