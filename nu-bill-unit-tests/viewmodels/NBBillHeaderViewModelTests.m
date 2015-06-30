//
//  NBBillHeaderViewModelTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBillHeaderViewModel.h"
#import "NBModelConverter.h"
#import "NBBill.h"

@interface NBBillHeaderViewModelTests : XCTestCase

@end

@implementation NBBillHeaderViewModelTests

- (void)testShouldFailWhenSendNilModel {
    XCTAssertThrows([[NBBillHeaderViewModel alloc] initWithBill:nil], @"Should fail if no model is sent");
}

- (void)testShouldFormatBillPeriodCorrectly {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"summary" : @{
                                     @"close_date" : @"2015-04-07",
                                     @"open_date": @"2015-03-17"
                                     }};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBBillHeaderViewModel *modelView = [[NBBillHeaderViewModel alloc] initWithBill:bill];
    XCTAssertEqualObjects(@"DE 17 MAR ATÉ 7 ABR", modelView.billPeriod);
}

@end
