//
//  NBBillResultTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBillResult.h"
#import "NBModelConverter.h"

@interface NBBillResultTests : XCTestCase

@end

@implementation NBBillResultTests

- (void)testShouldBeAbleToParseValidBillResultObject {
    NSDictionary *values = @{@"bill" :
                                 @{@"state" : @"overdue",
                                   @"id": @"55256cd0-10f7-4fd3-a3be-213bfe01857d",
                                   @"barcode": @"03394643200000389339646532300000001745800102",
                                   @"linha_digitavel": @"03399.64652 32300.000000 17458.001025 4 64320000038933"}};
    NBBillResult *billResult = [NBModelConverter convertModelFromJSON:values class:[NBBillResult class]];
    XCTAssertNotNil(billResult, @"Bill result should not be empty when a valid object is sent");
    XCTAssertNotNil(billResult.bill, @"Bill result should not be empty when a valid object is sent");
}
@end
