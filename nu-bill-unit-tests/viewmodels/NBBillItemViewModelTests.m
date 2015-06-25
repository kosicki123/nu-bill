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
#import "NBModelConverter.h"
#import "NBBillItem.h"
#import "NBColors.h"

@interface NBBillItemViewModelTests : XCTestCase

@end

@implementation NBBillItemViewModelTests

- (void)testShouldFailIfNilModelIsSent {
    XCTAssertThrows([[NBBillItemViewModel alloc] initWithBillItem:nil], @"Should fail when sending nil as parameter");
}

- (void)testShouldFormatPostDateBeforeDay10Correctly {
    NSDictionary *data = @{@"post_date" : @"2015-05-09"};
    NBBillItem *itemWithPostDateBeforeDay10 = [NBModelConverter convertModelFromJSON:data
                                                                               class:[NBBillItem class]];
    NBBillItemViewModel *viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithPostDateBeforeDay10];
    XCTAssertEqualObjects(@"9  MAY", viewModel.postDate);
}

- (void)testShouldFormatPostDateAfterDay10Correctly {
    NSDictionary *data = @{@"post_date" : @"2015-05-15"};
    NBBillItem *itemWithPostDateBeforeDay10 = [NBModelConverter convertModelFromJSON:data
                                                                               class:[NBBillItem class]];
    NBBillItemViewModel *viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithPostDateBeforeDay10];
    XCTAssertEqualObjects(@"15 MAY", viewModel.postDate);
}

- (void)testShouldFormatTitleWithoutInstallmentsCorrectly {
    NSDictionary *data = @{@"post_date" : @"2015-05-09",
                           @"amount" : @(1642),
                           @"title" : @"Al Fanous Restaurante",
                           @"index" : @(0),
                           @"charges" : @(1)};
    NBBillItem *itemWithoutInstallments = [NBModelConverter convertModelFromJSON:data
                                                                           class:[NBBillItem class]];
    NBBillItemViewModel *viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithoutInstallments];
    XCTAssertEqualObjects(@"Al Fanous Restaurante", viewModel.title, @"Should parse title correctly without installments");
}

- (void)testShouldFormatTitleWithInstallmentsCorrectly {
    NSDictionary *data = @{@"post_date" : @"2015-05-09",
                           @"amount" : @(1642),
                           @"title" : @"Al Fanous Restaurante",
                           @"index" : @(1),
                           @"charges" : @(2)};
    NBBillItem *itemWithoutInstallments = [NBModelConverter convertModelFromJSON:data
                                                                           class:[NBBillItem class]];
    NBBillItemViewModel *viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithoutInstallments];
    XCTAssertEqualObjects(@"Al Fanous Restaurante 2/2", viewModel.title, @"Should parse title correctly when it has installments");
}

- (void)testShouldFormatAmountCorrectly {
    NSDictionary *data = @{@"amount" : @(1642)};
    NBBillItem *itemWithRoundedAmount = [NBModelConverter convertModelFromJSON:data
                                                                         class:[NBBillItem class]];
    NBBillItemViewModel *viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithRoundedAmount];
    XCTAssertEqualObjects(@"1642.00", viewModel.amount);
    
    data = @{@"amount" : @(1642.12)};
    NBBillItem *itemWithTwoDecimal = [NBModelConverter convertModelFromJSON:data
                                                                   class:[NBBillItem class]];
    viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithTwoDecimal];
    XCTAssertEqualObjects(@"1642.12", viewModel.amount);
    
    data = @{@"amount" : @(1642.911)};
    NBBillItem *itemWithMoreDecimals = [NBModelConverter convertModelFromJSON:data
                                                                        class:[NBBillItem class]];
    viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithMoreDecimals];
    XCTAssertEqualObjects(@"1642.91", viewModel.amount);
    XCTAssertEqualObjects([UIColor lightGrayColor], viewModel.colorAmount);
    
    data = @{@"amount" : @(-1642.91)};
    NBBillItem *itemWithNegativeAmount = [NBModelConverter convertModelFromJSON:data
                                                                          class:[NBBillItem class]];
    viewModel = [[NBBillItemViewModel alloc] initWithBillItem:itemWithNegativeAmount];
    XCTAssertEqualObjects(@"1642.91", viewModel.amount);
    XCTAssertEqualObjects([NBColors lightGreenColor], viewModel.colorAmount);
}

@end
