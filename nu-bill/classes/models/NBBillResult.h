//
//  NBBillResult.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseModel.h"
#import "NBBill.h"

@interface NBBillResult : NBBaseModel

@property (nonatomic, readonly, copy) NBBill *bill;

@end
