//
//  NBBillTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBill.h"
#import "NBModelConverter.h"

@interface NBBillTests : XCTestCase

@end

@implementation NBBillTests

- (void)testShouldBeAbleToParseAValidBillObject {
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
                             },
                             @"barcode": @"03394643200000389339646532300000001745800102",
                             @"linha_digitavel": @"03399.64652 32300.000000 17458.001025 4 64320000038933"};
    NBBill *bill = [NBModelConverter convertModelFromJSON:values class:[NBBill class]];
    XCTAssertNotNil(bill, @"Should not be nil when converting a valid bill model");
    XCTAssertEqual(bill.state, NBBillStateOverdue, @"Should be an overdue state");
    XCTAssertEqualObjects(bill.billId, @"55256cd0-10f7-4fd3-a3be-213bfe01857d", @"Should be the same bill id");
    XCTAssertEqualObjects(bill.barcode, @"03394643200000389339646532300000001745800102", @"Should be the same barcode");
    XCTAssertEqualObjects(bill.writableBarcode, @"03399.64652 32300.000000 17458.001025 4 64320000038933", @"Should be the same writable barcode");
}

- (void)testShouldBeSameBillWhenIdentifierIsTheSame {
    NSDictionary *valuesOne = @{@"state" : @"overdue",
                                @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    NSDictionary *valuesTwo = @{@"state" : @"closed",
                                @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d"};
    
    NBBill *billOne = [NBModelConverter convertModelFromJSON:valuesOne class:[NBBill class]];
    NBBill *billTwo = [NBModelConverter convertModelFromJSON:valuesTwo class:[NBBill class]];
    
    XCTAssertEqualObjects(billOne, billTwo, @"Should be same bill just by compering bill id");
}

@end
