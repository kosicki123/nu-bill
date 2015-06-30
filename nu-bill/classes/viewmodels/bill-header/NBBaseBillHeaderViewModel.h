//
//  NBBaseBillHeaderViewModel.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/29/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "NBBill.h"

@interface NBBaseBillHeaderViewModel : NSObject

- (instancetype)initWithBill:(NBBill *)bill;

@property (nonatomic, copy, readonly) UIColor *backgroundColor;
@property (nonatomic, copy, readonly) NSString *totalBalance;
@property (nonatomic, copy, readonly) NSString *dueDay;

@end
