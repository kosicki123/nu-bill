//
//  NBBaseModelTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBBaseModel.h"

@interface NBBaseModelTests : XCTestCase

@end

@implementation NBBaseModelTests

- (void)testsShouldFailWhenChildOfBaseModelDontOverrideJSONKeyPathsByPropertyKeyMethod {
    XCTAssertThrows([NBBaseModel JSONKeyPathsByPropertyKey], @"Should fail when child class don't override JSONKeyPathsByPropertyKey");
}

@end
