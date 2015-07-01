//
//  NBOverdueBillHeaderView.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/27/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBOverdueBillHeaderView.h"
#import "NBOverdueBillHeaderViewModel.h"

@interface NBOverdueBillHeaderView()

@property (weak, nonatomic) IBOutlet UIView *viewTotalPaied;
@property (weak, nonatomic) IBOutlet UILabel *lbPaymentPaied;
@property (weak, nonatomic) IBOutlet UILabel *lbTotalPaied;

@end

@implementation NBOverdueBillHeaderView

- (void)setViewModel:(NBOverdueBillHeaderViewModel *)viewModel {
    [super setViewModel:viewModel];
    
    if (!viewModel.totalPaied) {
        self.frame = self.viewTotalBalance.frame;
        self.viewTotalPaied.hidden = YES;
        
        return;
    }
    
    self.lbTotalPaied.text = viewModel.totalPaied;
    self.lbPaymentPaied.textColor = self.viewModel.backgroundColor;
    self.lbTotalPaied.textColor = self.viewModel.backgroundColor;
}

@end
