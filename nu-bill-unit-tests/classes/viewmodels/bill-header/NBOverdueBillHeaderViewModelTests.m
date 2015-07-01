//
//  NBOverdueBillHeaderViewModelTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBModelConverter.h"
#import "NBOverdueBillHeaderViewModel.h"

@interface NBOverdueBillHeaderViewModelTests : XCTestCase

@end

@implementation NBOverdueBillHeaderViewModelTests

- (void)testShouldNotHaveAnTotalPaiedValueWhenPaidIsGreaterThanZero {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"due_date" : @"2015-04-20",
                                     @"close_date" : @"2015-04-07",
                                     @"past_balance" : @(0),
                                     @"total_balance": @(38933),
                                     @"interest": @(0),
                                     @"total_cumulative": @(38933),
                                     @"paid": @(38933),
                                     @"minimum_payment" : @(5840),
                                     @"open_date": @"2015-03-17"
                                     }};
    
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBOverdueBillHeaderViewModel *viewModel = [[NBOverdueBillHeaderViewModel alloc] initWithBill:bill];
    
    XCTAssertNil(viewModel.totalPaied);
}

- (void)testShouldHaveAnTotalPaiedValueWhenPaidIsNegative {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"due_date" : @"2015-04-20",
                                     @"close_date" : @"2015-04-07",
                                     @"past_balance" : @(0),
                                     @"total_balance": @(38933),
                                     @"interest": @(0),
                                     @"total_cumulative": @(38933),
                                     @"paid": @(-38933),
                                     @"minimum_payment" : @(5840),
                                     @"open_date": @"2015-03-17"
                                     }};
    
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBOverdueBillHeaderViewModel *viewModel = [[NBOverdueBillHeaderViewModel alloc] initWithBill:bill];
    
    XCTAssertNotNil(viewModel.totalPaied);
    XCTAssertEqualObjects(@"R$389,33", viewModel.totalPaied);
}

@end
