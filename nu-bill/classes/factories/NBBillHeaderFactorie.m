//
//  NBBillHeaderFactorie.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/27/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillHeaderFactorie.h"
#import "NBOverdueBillHeaderView.h"
#import "NBClosedBillHeaderView.h"
#import "NBOpenBillHeaderView.h"
#import "NBFutureBillHeaderView.h"

#import "NBOpenBillHeaderViewModel.h"
#import "NBClosedBillHeaderViewModel.h"

@implementation NBBillHeaderFactorie

+ (NBBaseBillHeader *)headerForBill:(NBBill *)bill {
    NBBaseBillHeader *header = nil;
    NBBaseBillHeaderViewModel *viewModel = [[NBBaseBillHeaderViewModel alloc] initWithBill:bill];
    switch (bill.state) {
        case NBBillStateOverdue:
            header = [NBOverdueBillHeaderView loadFromNib];
            break;
        case NBBillStateClosed:
            header = [NBClosedBillHeaderView loadFromNib];
            viewModel = [[NBClosedBillHeaderViewModel alloc] initWithBill:bill];
            break;
        case NBBillStateOpen:{
            header = [NBOpenBillHeaderView loadFromNib];
            viewModel = [[NBOpenBillHeaderViewModel alloc] initWithBill:bill];
            break;
        }
        case NBBillStateFuture:
            header = [NBFutureBillHeaderView loadFromNib];
            break;
    }
    
    header.viewModel = viewModel;
    return header;
}

@end
