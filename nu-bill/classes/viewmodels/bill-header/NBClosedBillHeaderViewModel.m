//
//  NBClosedBillHeaderViewModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/30/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBClosedBillHeaderViewModel.h"
#import "NBNumberFormatter.h"

@implementation NBClosedBillHeaderViewModel

- (instancetype)initWithBill:(NBBill *)bill {
    self = [super initWithBill:bill];
    if (self) {
        [self buildExtraValuesForBill:bill];
    }
    return self;
}

#pragma mark - private methods

- (void)buildExtraValuesForBill:(NBBill *)bill {
    NSMutableString *extraValues = [NSMutableString string];
    if (bill.summary.totalCumulative.doubleValue > 0) {
        _totalCumulative = [NBNumberFormatter currencyStringFromNumber:bill.summary.totalCumulative];
        [extraValues appendFormat:NSLocalizedString(@"Gastos do mês\t%@", nil), _totalCumulative];
    }
    
    NSNumber *pastBalance = bill.summary.pastBalance;
    if (pastBalance.floatValue > 0) {
        if (extraValues.length > 0) [extraValues appendString:@"\n"];
        
        _pastBalance = [NBNumberFormatter currencyStringFromNumber:pastBalance];
        [extraValues appendFormat:NSLocalizedString(@"Valores não pagos\t%@", nil), _pastBalance];
    } else if (pastBalance.floatValue < 0) {
        if (extraValues.length > 0) [extraValues appendString:@"\n"];
        
        NSNumber *absolutPastBalance = [NSNumber numberWithDouble:fabs(pastBalance.doubleValue)];
        _pastBalance = [NBNumberFormatter currencyStringFromNumber:absolutPastBalance];
        [extraValues appendFormat:NSLocalizedString(@"Valores pré-pago\t%@", nil), _pastBalance];
    }
    
    if (bill.summary.interest.floatValue > 0) {
        if (extraValues.length > 0) [extraValues appendString:@"\n"];
        
        _interest = [NBNumberFormatter currencyStringFromNumber:bill.summary.interest];
        [extraValues appendFormat:NSLocalizedString(@"Juros 7,75%\t%@", nil), _interest];
    }
    
    _extraValues = [extraValues copy];
}

@end
