//
//  NBBillItemViewModel.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillItemViewModel.h"
#import "NBBillItem.h"
#import "NBDateFormatter.h"
#import "NBColors.h"

@interface NBBillItemViewModel()

@property (nonatomic, strong) NBBillItem *billItem;

@end

@implementation NBBillItemViewModel

- (instancetype)initWithBillItem:(NBBillItem *)billItem {
    NSParameterAssert(billItem);
    self = [super init];
    if (self) {
        self.billItem = billItem;
    
    }
    return self;
}

#pragma mark - private methods

- (void)buildPostDate {
    NSString *postMonth = [NBDateFormatter monthForDate:self.billItem.postDate];
    NSNumber *postDay = [NBDateFormatter dayOfDate:self.billItem.postDate];
    
    NSString *postDate = [NSString stringWithFormat:@"%@", postDay];
    if (postDate.intValue < 10) {
        postDate = [postDate stringByAppendingString:@" "];
    }
    
    _postDate = [NSString stringWithFormat:@"%@ %@", postDate, postMonth];
}

- (void)buildTitle {
    _title = self.billItem.title;
    if (self.billItem.charges.intValue > 1) {
        NSString *installment = [NSString stringWithFormat:@" %i/%i", self.billItem.index.intValue + 1, self.billItem.charges.intValue];
        _title = [_title stringByAppendingString:installment];;
    }
}

- (void)buildAmount {
    float absoluteValue = fabs(self.billItem.amount.floatValue);
    _amount = [NSString stringWithFormat:@"%.2f", absoluteValue];
}

- (void)buildColorAmount {
    _colorAmount = self.billItem.amount.intValue < 0 ? [NBColors lightGreenColor] : [UIColor lightGrayColor];
}

#pragma mark - getter/setter

- (void)setBillItem:(NBBillItem *)billItem {
    _billItem = billItem;
    
    [self buildPostDate];
    [self buildTitle];
    [self buildAmount];
    [self buildColorAmount];
}

@end
