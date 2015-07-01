//
//  NBOverdueBillHeaderViewModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/30/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBOverdueBillHeaderViewModel.h"
#import "NBNumberFormatter.h"

@implementation NBOverdueBillHeaderViewModel

- (instancetype)initWithBill:(NBBill *)bill {
    self = [super initWithBill:bill];
    if (self) {
        [self buildPaiedValueFromBill:bill];
    }
    return self;
}

#pragma mark - private methods

- (void)buildPaiedValueFromBill:(NBBill *)bill {
    if (bill.summary.paid.floatValue > 0.f) {
        return;
    }
    
    NSNumber *absolutePaied = [NSNumber numberWithDouble:fabs([bill.summary.paid doubleValue])];
    _totalPaied = [NBNumberFormatter currencyStringFromNumber:absolutePaied];
}

@end
