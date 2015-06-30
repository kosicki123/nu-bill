//
//  NBBaseBillHeader.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseView.h"
#import "NBBaseBillHeaderViewModel.h"

@interface NBBaseBillHeader : NBBaseView

@property (weak, nonatomic) IBOutlet UIView *viewTotalBalance;
@property (weak, nonatomic) IBOutlet UILabel *lbTotalBalance;
@property (weak, nonatomic) IBOutlet UILabel *lbDueDay;

@property (nonatomic, strong) NBBaseBillHeaderViewModel *viewModel;

@end
