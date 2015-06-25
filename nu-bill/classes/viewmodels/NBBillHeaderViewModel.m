//
//  NBBillHeaderViewModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillHeaderViewModel.h"
#import "NBDateFormatter.h"
#import "NBBill.h"

@interface NBBillHeaderViewModel()

@property (nonatomic, strong) NBBill *bill;

@end

@implementation NBBillHeaderViewModel

- (instancetype)initWithBill:(NBBill *)bill {
    NSParameterAssert(bill);
    self = [super init];
    if (self) {
        self.bill = bill;
    }
    return self;
}

#pragma mark - getter/setter

- (void)setBill:(NBBill *)bill {
    _bill = bill;
    
    NSNumber *openDay = [NBDateFormatter dayOfDate:bill.summary.openDate];
    NSNumber *closeDay = [NBDateFormatter dayOfDate:bill.summary.closeDate];
    NSString *openMonth = [NBDateFormatter monthForDate:bill.summary.openDate];
    NSString *closeMonth = [NBDateFormatter monthForDate:bill.summary.closeDate];
    
    NSString *format = NSLocalizedString(@"DE %@ %@ ATÉ %@ %@", nil);
    NSString *title = [NSString stringWithFormat:format, openDay, openMonth, closeDay, closeMonth];
    _billPeriod = title;
}

@end
