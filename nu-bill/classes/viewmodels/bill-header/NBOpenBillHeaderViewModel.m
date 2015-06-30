//
//  NBOpenBillHeaderViewModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBOpenBillHeaderViewModel.h"
#import "NBDateFormatter.h"

@implementation NBOpenBillHeaderViewModel

- (instancetype)initWithBill:(NBBill *)bill {
    self = [super initWithBill:bill];
    if (self) {
        [self buildCloseDateForBill:bill];
    }
    return self;
}

- (void)buildCloseDateForBill:(NBBill *)bill {
    NSString *closeDateFormat = NSLocalizedString(@"FECHAMENTO EM %@ DE %@", nil);
    
    NSString *longCloseMonth = [NBDateFormatter longMonthForDate:bill.summary.closeDate];
    NSNumber *closeDay = [NBDateFormatter dayOfDate:bill.summary.closeDate];
    _closeDate = [NSString stringWithFormat:closeDateFormat, closeDay, longCloseMonth];
}

@end
