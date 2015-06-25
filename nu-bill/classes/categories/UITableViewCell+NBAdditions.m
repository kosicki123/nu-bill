//
//  UITableViewCell+NBAdditions.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "UITableViewCell+NBAdditions.h"

@implementation UITableViewCell (NBAdditions)

+ (void)registerCellOnTableView:(UITableView *)tableView {
    [tableView registerClass:self
      forCellReuseIdentifier:NSStringFromClass(self)];
}

+ (void)registerXibOnTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:[NSBundle mainBundle]]
    forCellReuseIdentifier:NSStringFromClass(self)];
}

+ (instancetype)dequeueCellOnTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self) forIndexPath:indexPath];
}

+ (instancetype)dequeueCellOnTableView:(UITableView *)tableView {
    return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
}

@end
