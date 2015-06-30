//
//  NBOpenBillHeaderView.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/27/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBOpenBillHeaderView.h"
#import "NBOpenBillHeaderViewModel.h"
@interface NBOpenBillHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *lbCloseDate;
@property (weak, nonatomic) IBOutlet UIButton *btGenerateBill;

@end

@implementation NBOpenBillHeaderView

- (void)setViewModel:(NBOpenBillHeaderViewModel *)viewModel {
    [super setViewModel:viewModel];
    
    self.lbCloseDate.text = viewModel.closeDate;
    
    self.btGenerateBill.layer.cornerRadius = 5.f;
    self.btGenerateBill.layer.borderColor = viewModel.backgroundColor.CGColor;
    self.btGenerateBill.layer.borderWidth = 1.f;
}

@end
