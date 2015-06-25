//
//  NBBillViewController.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseViewController.h"

@class NBBill;
@interface NBBillViewController : UITableViewController

- (instancetype)initWithBill:(NBBill *)bill;

@end
