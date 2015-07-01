//
//  NBBaseBillHeaderViewModelTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBModelConverter.h"

#import "NBBaseBillHeaderViewModel.h"
#import "NBNumberFormatter.h"

#import "NBColors.h"

@interface NBBaseBillHeaderViewModelTests : XCTestCase

@end

@implementation NBBaseBillHeaderViewModelTests

- (void)testShouldFailIfSendNilModelToViewModel {
    XCTAssertThrows([[NBBaseBillHeaderViewModel alloc] initWithBill:nil]);
}

- (void)testShouldParseTotalBalance {
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
    NBBaseBillHeaderViewModel *viewModel = [[NBBaseBillHeaderViewModel alloc] initWithBill:bill];
    
    XCTAssertEqualObjects(viewModel.totalBalance, [NBNumberFormatter currencyStringFromNumber:bill.summary.totalBalance]);
}

- (void)testShouldParseDueDay {
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
    NBBaseBillHeaderViewModel *viewModel = [[NBBaseBillHeaderViewModel alloc] initWithBill:bill];
    
    NSString *dueDay = NSLocalizedString(@"Vencimento %@", nil);
    dueDay = [NSString stringWithFormat:dueDay, @"7 ABR"];
    XCTAssertEqualObjects(viewModel.dueDay, dueDay);
}

- (void)testShouldBeRightColorForState {
    NSDictionary *values = @{@"state" : @"overdue",
                             @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    NBBaseBillHeaderViewModel *viewModel = [[NBBaseBillHeaderViewModel alloc] initWithBill:bill];
    
    XCTAssertEqualObjects(viewModel.backgroundColor, [NBColors overdueBillColor]);
}

@end
