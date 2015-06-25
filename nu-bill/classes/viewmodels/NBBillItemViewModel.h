//
//  NBBillItemViewModel.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NBBillItem;
@interface NBBillItemViewModel : NSObject

@property (nonatomic, copy, readonly) NSString *postDate;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *amount;
@property (nonatomic, copy, readonly) UIColor *colorAmount;

- (instancetype)initWithBillItem:(NBBillItem *)billItem;

@end
