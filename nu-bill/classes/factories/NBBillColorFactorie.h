//
//  NBBillColorFactorie.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NBBill;
@interface NBBillColorFactorie : NSObject

+ (UIColor *)colorForBill:(NBBill *)bill;

@end
