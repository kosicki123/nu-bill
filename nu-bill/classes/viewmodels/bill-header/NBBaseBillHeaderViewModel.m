//
//  NBBaseBillHeaderViewModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseBillHeaderViewModel.h"
#import "NBBillColorFactorie.h"
#import "NBDateFormatter.h"
#import "NBNumberFormatter.h"

@interface NBBaseBillHeaderViewModel()

@property (nonatomic, strong) NBBill *bill;

@end

@implementation NBBaseBillHeaderViewModel

- (instancetype)initWithBill:(NBBill *)bill {
    NSParameterAssert(bill);
    self = [super init];
    if (self) {
        self.bill = bill;
    }
    return self;
}

#pragma mark - private methods

- (void)buildTotalBalance {
    _totalBalance = [NBNumberFormatter currencyStringFromNumber:self.bill.summary.totalBalance];
}

- (void)buildBackgroundColor {
    _backgroundColor = [NBBillColorFactorie colorForBill:self.bill];
}

- (void)buildDueDay {
    NSString *dueDayFormat = NSLocalizedString(@"Vencimento %@ %@", nil);
    NSString *dueMonth = [NBDateFormatter mediumMonthForDate:self.bill.summary.closeDate];
    NSNumber *dueDay = [NBDateFormatter dayOfDate:self.bill.summary.closeDate];
    
    _dueDay = [NSString stringWithFormat:dueDayFormat, dueDay, dueMonth];
}

#pragma mark - getter/setter

- (void)setBill:(NBBill *)bill {
    _bill = bill;
    
    [self buildTotalBalance];
    [self buildBackgroundColor];
    [self buildDueDay];
}

@end
