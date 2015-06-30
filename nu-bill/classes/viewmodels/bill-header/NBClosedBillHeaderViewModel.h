//
//  NBClosedBillHeaderViewModel.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/30/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseBillHeaderViewModel.h"

@interface NBClosedBillHeaderViewModel : NBBaseBillHeaderViewModel

@property (nonatomic, copy, readonly) NSString *totalCumulative;
@property (nonatomic, copy, readonly) NSString *pastBalance;
@property (nonatomic, copy, readonly) NSString *interest;

@property (nonatomic, copy, readonly) NSString *extraValues;

@end
