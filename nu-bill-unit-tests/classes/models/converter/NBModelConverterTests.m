//
//  NBModelConverterTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "NBModelConverter.h"
#import "NBBill.h"

@interface NBDummyClass : NSObject

@end

@implementation NBDummyClass

@end

@interface NBModelConverterTests : XCTestCase

@end

@implementation NBModelConverterTests

- (void)testShouldFailIfNilClassToParseIsUsedForDictionaries {
    XCTAssertThrows([NBModelConverter convertModelFromJSON:@{} class:nil], @"Should fail when sending a nil class to convert an dictionary");
}

- (void)testShouldFailIfNilClassToParseIsUsedForArrays {
    XCTAssertThrows([NBModelConverter convertModelsFromJSON:@[] class:nil], @"Should fail when sending a nil class to convert an array");
}

- (void)testShouldReturnNilWhenSendingNilDictionaryToConvert {
    XCTAssertNil([NBModelConverter convertModelFromJSON:nil class:[NBBill class]], @"Should return nil when converting nil dictionary");
}

- (void)testShouldReturnNilWhenSendingNilArrayToConvert {
    XCTAssertNil([NBModelConverter convertModelsFromJSON:nil class:[NBBill class]], @"Should return nil when converting nil array");
}

- (void)testShouldReturnEmptyArrayIfEmptyArrayIsSent {
    NSArray *convertedObject = [NBModelConverter convertModelsFromJSON:@[] class:[NBBill class]];
    XCTAssertNotNil(convertedObject, @"Should not be nil when converting empty array");
    XCTAssertTrue(0 == convertedObject.count, @"");
}

- (void)testShouldReturnNilIfInvalidModelClassIsSent {
    XCTAssertNil([NBModelConverter convertModelFromJSON:@{} class:[NBDummyClass class]], @"Should return nil if invalid model class is sent");
    XCTAssertNil([NBModelConverter convertModelsFromJSON:@[@{}] class:[NBDummyClass class]], @"Should return nil if invalid model class is sent");
}

@end
