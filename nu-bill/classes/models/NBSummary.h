//
//  NBSummary.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseModel.h"

@interface NBSummary : NBBaseModel

@property (nonatomic, readonly, copy) NSDate *dueDate;
@property (nonatomic, readonly, copy) NSDate *closeDate;
@property (nonatomic, readonly, copy) NSNumber *pastBalance;
@property (nonatomic, readonly, copy) NSNumber *totalBalance;
@property (nonatomic, readonly, copy) NSNumber *interest;
@property (nonatomic, readonly, copy) NSNumber *totalCumulative;
@property (nonatomic, readonly, copy) NSNumber *paid;
@property (nonatomic, readonly, copy) NSNumber *minimumPayment;
@property (nonatomic, readonly, copy) NSDate *openDate;

@end
