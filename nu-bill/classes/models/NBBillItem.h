//
//  NBBillItem.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/23/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBaseModel.h"

@interface NBBillItem : NBBaseModel

@property (nonatomic, copy, readonly) NSDate *postDate;
@property (nonatomic, copy, readonly) NSNumber *amount;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSNumber *index;
@property (nonatomic, copy, readonly) NSNumber *charges;
@property (nonatomic, copy, readonly) NSURL *href;

@end
