//
//  NBBill.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseModel.h"
#import "NBSummary.h"
#import "NBBillItem.h"

typedef NS_ENUM(NSUInteger, NBBillState) {
    NBBillStateOverdue,
    NBBillStateClosed,
    NBBillStateOpen,
    NBBillStateFuture
};

@interface NBBill : NBBaseModel

@property (nonatomic, copy, readonly) NSString *billId;
@property (nonatomic, copy, readonly) NBSummary *summary;
@property (nonatomic, readonly) NBBillState state;
@property (nonatomic, copy, readonly) NSString *barcode;
@property (nonatomic, copy, readonly) NSString *writableBarcode;
@property (nonatomic, strong, readonly) NSArray *items; //<NSBillItem *>

- (BOOL)isEqualToBill:(NBBill *)bill;

@end
