//
//  NBSummaryTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBSummary.h"
#import "NBDateConverter.h"
#import "NBModelConverter.h"

@interface NBSummaryTests : XCTestCase

@end

@implementation NBSummaryTests

- (void)testShouldBeAbleToParseAValidSummaryObject {
    NSDictionary *summaryData = @{@"due_date" : @"2015-04-20",
                                  @"close_date" : @"2015-04-07",
                                  @"past_balance" : @(0),
                                  @"total_balance": @(38933),
                                  @"interest": @(0),
                                  @"total_cumulative": @(38933),
                                  @"paid": @(38933),
                                  @"minimum_payment" : @(5840),
                                  @"open_date": @"2015-03-17"};
    NBSummary *summary = [NBModelConverter convertModelFromJSON:summaryData
                                                          class:[NBSummary class]];
    
    XCTAssertNotNil(summary, @"Should not be nil when converting a valid summary model");
    XCTAssertEqualObjects(summary.dueDate, [NBDateConverter dateFromString:@"2015-04-20"]);
    XCTAssertEqualObjects(summary.closeDate, [NBDateConverter dateFromString:@"2015-04-07"]);
    XCTAssertEqualObjects(summary.pastBalance, @(0));
    XCTAssertEqualObjects(summary.totalBalance, @(38933));
    XCTAssertEqualObjects(summary.interest, @(0));
    XCTAssertEqualObjects(summary.totalCumulative, @(38933));
    XCTAssertEqualObjects(summary.paid, @(38933));
    XCTAssertEqualObjects(summary.minimumPayment, @(5840));
    XCTAssertEqualObjects(summary.openDate, [NBDateConverter dateFromString:@"2015-03-17"]);
}

@end
