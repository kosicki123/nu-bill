//
//  NBBillHeaderFactorieTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBillHeaderFactorie.h"
#import "NBModelConverter.h"

#import "NBOverdueBillHeaderView.h"
#import "NBOverdueBillHeaderViewModel.h"

#import "NBClosedBillHeaderView.h"
#import "NBClosedBillHeaderViewModel.h"

#import "NBOpenBillHeaderView.h"
#import "NBOpenBillHeaderViewModel.h"

#import "NBFutureBillHeaderView.h"

@interface NBBillHeaderFactorieTests : XCTestCase

@end

@implementation NBBillHeaderFactorieTests

- (void)testShouldFailWhenSendingNillBill {
    XCTAssertThrows([NBBillHeaderFactorie headerForBill:nil]);
}

- (void)testShouldBeAnOverdueHeaderWhenBillStateIsOverdue {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values
                                                    class:[NBBill class]];
    
    NBBaseBillHeader *header = [NBBillHeaderFactorie headerForBill:bill];
    XCTAssertTrue([header isKindOfClass:[NBOverdueBillHeaderView class]], @"Bill header factorie should create an Overdue header");
    XCTAssertTrue([header.viewModel isKindOfClass:[NBOverdueBillHeaderViewModel class]], @"Bill header factorie should create an overdue view model");
}

- (void)testShouldBeAClosedHeaderWhenBillStateIsClosed {
    NSDictionary *values = @{@"state" : @"closed",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values
                                                    class:[NBBill class]];
    
    NBBaseBillHeader *header = [NBBillHeaderFactorie headerForBill:bill];
    XCTAssertTrue([header isKindOfClass:[NBClosedBillHeaderView class]], @"Bill header factorie should create a closed header");
    XCTAssertTrue([header.viewModel isKindOfClass:[NBClosedBillHeaderViewModel class]], @"Bill header factorie should create a closed view model");
}

- (void)testShouldBeAnOpenHeaderWhenBillStateIsOpen {
    NSDictionary *values = @{@"state" : @"open",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values
                                                    class:[NBBill class]];
    
    NBBaseBillHeader *header = [NBBillHeaderFactorie headerForBill:bill];
    XCTAssertTrue([header isKindOfClass:[NBOpenBillHeaderView class]], @"Bill header factorie should create an open header");
    XCTAssertTrue([header.viewModel isKindOfClass:[NBOpenBillHeaderViewModel class]], @"Bill header factorie should create an open view model");
}

- (void)testShouldBeAFutureHeaderWhenBillStateIsFuture {
    NSDictionary *values = @{@"state" : @"future",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values
                                                    class:[NBBill class]];
    
    NBBaseBillHeader *header = [NBBillHeaderFactorie headerForBill:bill];
    XCTAssertTrue([header isKindOfClass:[NBFutureBillHeaderView class]], @"Bill header factorie should create a future header");
    XCTAssertTrue([header.viewModel isKindOfClass:[NBBaseBillHeaderViewModel class]], @"Bill header factorie should create a future view model");
}

@end
