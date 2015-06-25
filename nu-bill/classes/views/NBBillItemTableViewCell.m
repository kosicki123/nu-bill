//
//  NBBillItemTableViewCell.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillItemTableViewCell.h"
#import "NBColors.h"

#define kNBBillItemTableViewCellHeight 40.f

@interface NBBillItemTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *lbDate;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbAmout;

@property (weak, nonatomic) IBOutlet UIView *viBullet;

@end

@implementation NBBillItemTableViewCell

#pragma mark - public methods

+ (CGFloat)height {
    return kNBBillItemTableViewCellHeight;
}

#pragma mark - private methods

- (void)awakeFromNib {
    self.viBullet.layer.cornerRadius = CGRectGetWidth(self.viBullet.frame)/2;
    self.contentView.backgroundColor = [NBColors grayColor];
}

#pragma mark - getter/setter

- (void)setViewModel:(NBBillItemViewModel *)viewModel {
    _viewModel = viewModel;
    
    self.lbDate.text = viewModel.postDate;
    self.lbTitle.text = viewModel.title;
    self.lbAmout.text = viewModel.amount;
    self.lbAmout.textColor = viewModel.colorAmount;
}

@end
