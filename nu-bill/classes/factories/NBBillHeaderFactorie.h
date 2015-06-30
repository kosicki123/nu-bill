//
//  NBBillHeaderFactorie.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/27/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBBaseBillHeader.h"

@interface NBBillHeaderFactorie : NSObject

+ (NBBaseBillHeader *)headerForBill:(NBBill *)bill;

@end
