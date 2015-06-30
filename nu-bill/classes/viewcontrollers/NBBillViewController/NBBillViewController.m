//
//  NBBillViewController.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillViewController.h"
#import "NBBillItem.h"
#import "NBBill.h"
#import "NBColors.h"
#import "NBBillHeaderView.h"
#import "NBBillItemTableViewCell.h"
#import "NBBillHeaderFactorie.h"

#import <BlocksKit/NSArray+BlocksKit.h>

@interface NBBillViewController()

@property (nonatomic, strong) NBBill *bill;
@property (nonatomic, strong) NSArray *viewModels;

@end

@implementation NBBillViewController

- (instancetype)initWithBill:(NBBill *)bill {
    NSParameterAssert(bill);
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.bill = bill;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = [NBBillHeaderFactorie headerForBill:self.bill];
    [self customizeInterface];
    [self buildViewModels];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NBBillItemTableViewCell *cell = [NBBillItemTableViewCell dequeueCellOnTableView:tableView
                                                                        atIndexPath:indexPath];
    NBBillItemViewModel *viewModel = self.viewModels[indexPath.row];
    cell.viewModel = viewModel;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NBBillHeaderViewModel *viewModel = [[NBBillHeaderViewModel alloc] initWithBill:self.bill];
    return [NBBillHeaderView loadFromNibWithViewModel:viewModel];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [NBBillHeaderView height];
}

#pragma mark - private methods

- (void)customizeInterface {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [NBColors grayColor];
    self.tableView.rowHeight = [NBBillItemTableViewCell height];
    self.tableView.allowsSelection = NO;
    
    [NBBillItemTableViewCell registerXibOnTableView:self.tableView];
}

- (void)buildViewModels {
    self.viewModels = [self.bill.items bk_map:^NBBillItemViewModel *(NBBillItem *item) {
        return [[NBBillItemViewModel alloc] initWithBillItem:item];
    }];
}

@end
