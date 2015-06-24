//
//  NBBillItemTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBillItem.h"
#import "NBDateConverter.h"
#import "NBModelConverter.h"

@interface NBBillItemTests : XCTestCase

@end

@implementation NBBillItemTests

- (void)testShouldBeAbleToParseAValidBillItemObject {
    NSDictionary *billItemData = @{@"post_date": @"2015-05-09",
                                   @"amount" : @(1642),
                                   @"title" : @"Al Fanous Restaurante",
                                   @"index" : @(0),
                                   @"charges" : @(1),
                                   @"href": @"nuapp://transaction/554b8b66-0f3b-444b-9f67-2f467bd2e032"};
    NBBillItem *billItem = [NBModelConverter convertModelFromJSON:billItemData
                                                            class:[NBBillItem class]];
    
    XCTAssertNotNil(billItem, @"Bill Item should not be nil");
    XCTAssertEqualObjects(billItem.postDate, [NBDateConverter dateFromString:@"2015-05-09"]);
    XCTAssertEqualObjects(billItem.amount, @(1642));
    XCTAssertEqualObjects(billItem.title, @"Al Fanous Restaurante");
    XCTAssertEqualObjects(billItem.index, @(0));
    XCTAssertEqualObjects(billItem.charges, @(1));
    XCTAssertEqualObjects(billItem.href, [NSURL URLWithString:@"nuapp://transaction/554b8b66-0f3b-444b-9f67-2f467bd2e032"]);
}

@end
