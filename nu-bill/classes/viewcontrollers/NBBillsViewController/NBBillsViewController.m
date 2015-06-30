//
//  NBBillsViewController.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBBillsViewController.h"
#import "NBBillsController.h"
#import "NBBillViewController.h"
#import "NBBill.h"
#import "NBBillColorFactorie.h"
#import "NBColors.h"
#import "NBDateFormatter.h"

#import "NBSegmentedDelegateDatasource.h"
#import <BlocksKit/NSArray+BlocksKit.h>

@interface NBBillsViewController()

@property (nonatomic, strong) NBSegmentedDelegateDatasource *segmentedDatasource;

@property (nonatomic, strong) NSArray *bills;
@property (nonatomic, weak) NSURLSessionTask *billsTask;

@end

@implementation NBBillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeInterface];
    [self loadBills];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - private methods

- (void)customizeInterface {
    self.view.backgroundColor = [NBColors grayColor];
}

- (void)loadBills {
    [self showLoadingMessage:NSLocalizedString(@"Carregando contas", nil)];
    
    self.billsTask = [NBBillsController loadBillsWithCompletionBlock:^(NSArray *array, NSError *error) {
        [self dismissHud];
        
        if (error) {
            [self presentError:error inView:self.view];
            return;
        }
        
        self.bills = array;
        [self initializePageViewController];
    }];
}

- (void)initializePageViewController {
    if (self.segmentedDatasource) {
        return;
    }
    
    NSArray *viewControllers = [self.bills bk_map:^NBBillViewController *(NBBill *bill) {
        return [[NBBillViewController alloc] initWithBill:bill];
    }];
    
    DZNSegmentedControl *segmentControl = [self createSegmentControl];
    [self.view addSubview:segmentControl];
    
    UIPageViewController *pageViewController = [self createPageViewController:viewControllers[0]];
    
    CGRect frame = self.view.frame;
    frame.size.height -= CGRectGetMaxY(segmentControl.frame);
    frame.origin.y = CGRectGetMaxY(segmentControl.frame);
    pageViewController.view.frame = frame;
    
    [self addChildViewController:pageViewController];
    [self.view addSubview:pageViewController.view];
    [pageViewController didMoveToParentViewController:self];
    
    self.segmentedDatasource =
    [[NBSegmentedDelegateDatasource alloc] initWitPageViewController:pageViewController
                                                     viewControllers:viewControllers
                                                      segmentControl:segmentControl];
}

- (DZNSegmentedControl *)createSegmentControl {
    NSArray *titles = [self.bills bk_map:^NSString *(NBBill *bill) {
        return [NBDateFormatter mediumMonthForDate:bill.summary.dueDate];
    }];
    
    DZNSegmentedControl *segmentControl = [[DZNSegmentedControl alloc] initWithItems:titles];
    segmentControl.bouncySelectionIndicator = YES;
    
    [self.bills enumerateObjectsUsingBlock:^(NBBill *bill, NSUInteger idx, BOOL *stop) {
        [segmentControl setCount:[NBDateFormatter dayOfDate:bill.summary.dueDate]
               forSegmentAtIndex:idx];
        [segmentControl setTintColor:[NBBillColorFactorie colorForBill:bill] forSegmentAtIndex:idx];
    }];
    
    [segmentControl setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];

    return segmentControl;
}

- (UIPageViewController *)createPageViewController:(UIViewController *)initialViewController {
    UIPageViewController *pageViewController =
    [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                    navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                  options:nil];
    
    [pageViewController setViewControllers:@[initialViewController]
                                 direction:UIPageViewControllerNavigationDirectionForward
                                  animated:NO
                                completion:nil];
    
    return pageViewController;
}

@end
