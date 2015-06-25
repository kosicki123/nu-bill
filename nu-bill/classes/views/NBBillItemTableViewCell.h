//
//  NBBillItemTableViewCell.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseTableViewCell.h"
#import "NBBillItemViewModel.h"

@interface NBBillItemTableViewCell : NBBaseTableViewCell

@property (nonatomic, strong) NBBillItemViewModel *viewModel;

+ (CGFloat)height;

@end
