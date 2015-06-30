//
//  NBBaseBillHeader.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseBillHeader.h"

@implementation NBBaseBillHeader

- (void)setViewModel:(NBBaseBillHeaderViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.viewTotalBalance.backgroundColor = viewModel.backgroundColor;
    self.lbTotalBalance.text = viewModel.totalBalance;
    self.lbDueDay.text = viewModel.dueDay;
}

@end
