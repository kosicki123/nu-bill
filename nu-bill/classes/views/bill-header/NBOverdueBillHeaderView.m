//
//  NBOverdueBillHeaderView.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/27/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBOverdueBillHeaderView.h"

@interface NBOverdueBillHeaderView()

@property (weak, nonatomic) IBOutlet UIView *viewTotalReceived;
@property (weak, nonatomic) IBOutlet UILabel *lbPaimentRecevied;
@property (weak, nonatomic) IBOutlet UILabel *lbTotalReceived;

@end

@implementation NBOverdueBillHeaderView

- (void)setViewModel:(NBBaseBillHeaderViewModel *)viewModel {
    [super setViewModel:viewModel];
    
    self.lbPaimentRecevied.textColor = self.viewModel.backgroundColor;
    self.lbTotalReceived.textColor = self.viewModel.backgroundColor;
}

@end
