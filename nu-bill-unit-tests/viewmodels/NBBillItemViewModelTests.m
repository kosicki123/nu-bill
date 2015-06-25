//
//  NBBillItemViewModelTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/25/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBillItemViewModel.h"

@interface NBBillItemViewModelTests : XCTestCase

@end

@implementation NBBillItemViewModelTests

- (void)testShouldFailIfNilModelIsSent {
    XCTAssertThrows([[NBBillItemViewModel alloc] initWithBillItem:nil], @"Should fail when sending nil as parameter");
}

@end
