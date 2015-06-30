//
//  NBClosedBillHeaderView.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/27/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBClosedBillHeaderView.h"
#import "NBClosedBillHeaderViewModel.h"

@interface NBClosedBillHeaderView()

@property (weak, nonatomic) IBOutlet UIButton *btGenerateBill;
@property (weak, nonatomic) IBOutlet UILabel *lbExtraDetails;

@end

@implementation NBClosedBillHeaderView
@synthesize viewModel = _viewModel;

- (void)setViewModel:(NBClosedBillHeaderViewModel *)viewModel {
    [super setViewModel:viewModel];
    
    self.btGenerateBill.layer.cornerRadius = 5.f;
    self.btGenerateBill.layer.borderColor = viewModel.backgroundColor.CGColor;
    self.btGenerateBill.layer.borderWidth = 1.f;
}

- (NBClosedBillHeaderViewModel *)closedBillModel {
    return (NBClosedBillHeaderViewModel *)[super viewModel];
}

- (void)layoutSubviews {
    NBClosedBillHeaderViewModel *viewModel = self.closedBillModel;
    NSString *extraValues = viewModel.extraValues;
    NSDictionary *options = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    UIFont *boldFont = [UIFont boldSystemFontOfSize:14.f];
    
    NSMutableAttributedString *att =
        [[NSMutableAttributedString alloc] initWithString:extraValues
                                               attributes:options];
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentLeft;
    
    NSTextTab *t = [[NSTextTab alloc] initWithTextAlignment:NSTextAlignmentRight
                                                   location:self.lbExtraDetails.frame.size.width
                                                    options:nil];
    paragraph.tabStops = @[t];
    
    if (viewModel.totalCumulative) {
        NSRange totalCumulativeRange = [extraValues rangeOfString:viewModel.totalCumulative];
        [att addAttribute:NSFontAttributeName value:boldFont range:totalCumulativeRange];
    }
    if (viewModel.pastBalance) {
        NSRange pastBalanceRange = [extraValues rangeOfString:viewModel.pastBalance];
        [att addAttribute:NSFontAttributeName value:boldFont range:pastBalanceRange];
    }
    if (viewModel.interest) {
        NSRange interestRange = [extraValues rangeOfString:viewModel.interest];
        [att addAttribute:NSFontAttributeName value:boldFont range:interestRange];
    }
    
    [att addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, extraValues.length)];
    
    self.lbExtraDetails.attributedText = att;
}

@end
