//
//  NBBillColorFactorie.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillColorFactorie.h"
#import "NBBill.h"
#import "NBColors.h"

@implementation NBBillColorFactorie

+ (UIColor *)colorForBill:(NBBill *)bill {
    NSParameterAssert(bill);
    
    switch (bill.state) {
        case NBBillStateClosed:
            return [NBColors closedBillColor];
        case NBBillStateFuture:
            return [NBColors futureBillColor];
        case NBBillStateOpen:
            return [NBColors openBillColor];
        case NBBillStateOverdue:
            return [NBColors overdueBillColor];
    }
}

@end
