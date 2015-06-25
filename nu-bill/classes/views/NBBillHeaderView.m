//
//  NBBillHeaderView.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillHeaderView.h"
#import "NBColors.h"

#define kNBBillHeaderViewHeight 30.f

@interface NBBillHeaderView()

@property (weak, nonatomic) IBOutlet UILabel *lbBillPeriod;

@property (nonatomic, strong) NBBillHeaderViewModel *viewModel;

@end

@implementation NBBillHeaderView

+ (instancetype)loadFromNibWithViewModel:(NBBillHeaderViewModel *)viewModel {
    NSParameterAssert(viewModel);
    
    NBBillHeaderView *view = [super loadFromNib];
    view.viewModel = viewModel;
    
    return view;
}

+ (CGFloat)height {
    return kNBBillHeaderViewHeight;
}

- (void)awakeFromNib {
    self.backgroundColor = [NBColors grayColor];
}

#pragma mark - getter/setter

- (void)setViewModel:(NBBillHeaderViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.lbBillPeriod.text = viewModel.billPeriod;
}

@end
