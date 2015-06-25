//
//  NBBillHeaderViewModel.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NBBill;
@interface NBBillHeaderViewModel : NSObject

- (instancetype)initWithBill:(NBBill *)bill;

@property (nonatomic, copy, readonly) NSString *billPeriod;

@end
