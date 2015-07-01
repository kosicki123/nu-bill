//
//  KIFUITestActor+NBAdditions.m
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "KIFUITestActor+NBAdditions.h"

@implementation KIFUITestActor (NBAdditions)

- (void)waitUntilBillsAreLoaded {
    [self waitForAbsenceOfViewWithAccessibilityLabel:@"Carregando contas"];
}

- (void)scrollToNextBillPage {
    [self scrollViewWithAccessibilityLabel:@"bills" byFractionOfSizeHorizontal:-0.1f vertical:0.f];
    [self waitForTimeInterval:2.f];
}

@end
