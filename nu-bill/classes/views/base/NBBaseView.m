//
//  NBBaseView.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseView.h"

@implementation NBBaseView

+ (instancetype)loadFromNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                         owner:nil
                                       options:nil][0];
}

@end
