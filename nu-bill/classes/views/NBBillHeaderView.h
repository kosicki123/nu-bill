//
//  NBBillHeaderView.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseView.h"
#import "NBBillHeaderViewModel.h"

@interface NBBillHeaderView : NBBaseView

+ (instancetype)loadFromNibWithViewModel:(NBBillHeaderViewModel *)viewModel;
+ (CGFloat)height;

@end
