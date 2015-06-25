//
//  UITableViewCell+NBAdditions.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (NBAdditions)

+ (void)registerCellOnTableView:(UITableView *)tableView;

+ (void)registerXibOnTableView:(UITableView *)tableView;

+ (instancetype)dequeueCellOnTableView:(UITableView *)tableView
                           atIndexPath:(NSIndexPath *)indexPath;

+ (instancetype)dequeueCellOnTableView:(UITableView *)tableView;

@end
