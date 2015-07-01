//
//  NBClosedBillHeaderViewModelTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBModelConverter.h"
#import "NBClosedBillHeaderViewModel.h"

@interface NBClosedBillHeaderViewModelTests : XCTestCase

@end

@implementation NBClosedBillHeaderViewModelTests

- (void)testShouldParseBillWithTotalCumulativeGreaterThanZero {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"total_cumulative": @(38933)
                                     }};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBClosedBillHeaderViewModel *viewModel = [[NBClosedBillHeaderViewModel alloc] initWithBill:bill];
    
    NSString *totalCumulative = @"R$389,33";
    NSString *extraValues = NSLocalizedString(@"Gastos do mês\t%@", nil);
    extraValues = [NSString stringWithFormat:extraValues, totalCumulative];
    
    XCTAssertNotNil(viewModel.totalCumulative);
    XCTAssertEqualObjects(viewModel.totalCumulative, totalCumulative);
    XCTAssertEqualObjects(viewModel.extraValues, extraValues);
}

- (void)testShouldParseBillWithPastBalanceGreaterThanZero {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"past_balance": @(38933)
                                     }};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBClosedBillHeaderViewModel *viewModel = [[NBClosedBillHeaderViewModel alloc] initWithBill:bill];
    
    NSString *pastBalance = @"R$389,33";
    NSString *extraValues = NSLocalizedString(@"Valores não pagos\t%@", nil);
    extraValues = [NSString stringWithFormat:extraValues, pastBalance];
    
    XCTAssertNotNil(viewModel.pastBalance);
    XCTAssertEqualObjects(viewModel.pastBalance, pastBalance);
    XCTAssertEqualObjects(viewModel.extraValues, extraValues);
}

- (void)testShouldParseBillWithPastBalanceLessThanZero {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"past_balance": @(-38933)
                                     }};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBClosedBillHeaderViewModel *viewModel = [[NBClosedBillHeaderViewModel alloc] initWithBill:bill];
    
    NSString *pastBalance = @"R$389,33";
    NSString *extraValues = NSLocalizedString(@"Valores pré-pago\t%@", nil);
    extraValues = [NSString stringWithFormat:extraValues, pastBalance];
    
    XCTAssertNotNil(viewModel.pastBalance);
    XCTAssertEqualObjects(viewModel.pastBalance, pastBalance);
    XCTAssertEqualObjects(viewModel.extraValues, extraValues);
}

- (void)testShouldParseBillWithInterestGreaterThanZero {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"interest": @(38933)
                                     }};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBClosedBillHeaderViewModel *viewModel = [[NBClosedBillHeaderViewModel alloc] initWithBill:bill];
    
    NSString *interest = @"R$389,33";
    NSString *extraValues = NSLocalizedString(@"Juros 7,75%\t%@", nil);
    extraValues = [NSString stringWithFormat:extraValues, interest];
    
    XCTAssertNotNil(viewModel.interest);
    XCTAssertEqualObjects(viewModel.interest, interest);
    XCTAssertEqualObjects(viewModel.extraValues, extraValues);
}

- (void)testShouldParseBillWithInterestGreaterThanZeroAndPastBalanceGreaterThanZero {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                             @"summary" : @{
                                     @"interest": @(38933),
                                     @"past_balance": @(38933)
                                     }};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBClosedBillHeaderViewModel *viewModel = [[NBClosedBillHeaderViewModel alloc] initWithBill:bill];
    
    
    NSString *pastBalance = @"R$389,33";
    NSString *extraValuesBalance = NSLocalizedString(@"Valores não pagos\t%@", nil);
    extraValuesBalance = [NSString stringWithFormat:extraValuesBalance, pastBalance];
    
    NSString *interest = @"R$389,33";
    NSString *extraValuesInterest = NSLocalizedString(@"Juros 7,75%\t%@", nil);
    extraValuesInterest = [NSString stringWithFormat:extraValuesInterest, interest];

    NSString *extraValues = [NSString stringWithFormat:@"%@\n%@", extraValuesBalance, extraValuesInterest];
    
    XCTAssertEqualObjects(viewModel.extraValues, extraValues);
}

@end
