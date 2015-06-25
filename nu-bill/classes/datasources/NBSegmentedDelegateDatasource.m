//
//  NBSegmentedDelegateDatasource.m
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import "NBSegmentedDelegateDatasource.h"

@interface NBSegmentedDelegateDatasource()<UIPageViewControllerDataSource, UIPageViewControllerDelegate, DZNSegmentedControlDelegate>

@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic) NSInteger selectedIndex;

@end

@implementation NBSegmentedDelegateDatasource

- (instancetype)initWitPageViewController:(UIPageViewController *)pageViewController
                          viewControllers:(NSArray *)viewControllers
                           segmentControl:(DZNSegmentedControl *)segmentControl {
    self = [super init];
    if (self) {
        self.pageViewController = pageViewController;
        self.viewControllers = viewControllers;
        self.segmentControl = segmentControl;
    }
    return self;
}

#pragma mark - UIPageViewController methods

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    
    index--;
    return self.viewControllers[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [self.viewControllers indexOfObject:viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    if (index == self.viewControllers.count) {
        return nil;
    }
    
    return self.viewControllers[index];
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        self.selectedIndex = [self indexOfController:[pageViewController.viewControllers lastObject]];
        self.segmentControl.selectedSegmentIndex = self.selectedIndex;
    }
}


- (UIBarPosition)positionForBar:(id<UIBarPositioning>)view {
    return UIBarPositionBottom;
}

#pragma mark - segment methods

- (void)selectedSegment:(DZNSegmentedControl *)segmentControl {
    NSUInteger tempIndex = self.selectedIndex;
    
    if (self.segmentControl.selectedSegmentIndex > tempIndex) {
        for (int i = (int)tempIndex+1; i<=self.segmentControl.selectedSegmentIndex; i++) {
            [self movePageViewControllerToViewController:self.viewControllers[i]
                                               direction:UIPageViewControllerNavigationDirectionForward];
        }
    }
    else if (self.segmentControl.selectedSegmentIndex < tempIndex) {
        for (int i = (int)tempIndex-1; i >= self.segmentControl.selectedSegmentIndex; i--) {
            [self movePageViewControllerToViewController:self.viewControllers[i]
                                               direction:UIPageViewControllerNavigationDirectionReverse];
        }
    }
}

#pragma mark - private methods

- (void)movePageViewControllerToViewController:(UIViewController *)viewController
                                     direction:(UIPageViewControllerNavigationDirection)direction {
    NBSegmentedDelegateDatasource *__weak weakSelf = self;
    [self.pageViewController setViewControllers:@[viewController]
                                      direction:direction
                                       animated:YES
                                     completion:^(BOOL complete){
                                         if (complete) {
                                             weakSelf.selectedIndex = [weakSelf indexOfController:viewController];
                                         }
                                     }];
}

-(NSInteger)indexOfController:(UIViewController *)viewController {
    for (int i = 0; i<[self.viewControllers count]; i++) {
        if (viewController == self.viewControllers[i]) {
            return i;
        }
    }
    
    return NSNotFound;
}

#pragma mark - getter/setter

- (void)setSegmentControl:(DZNSegmentedControl *)segmentControl {
    _segmentControl = segmentControl;
    _segmentControl.delegate = self;
    
    [_segmentControl addTarget:self
                        action:@selector(selectedSegment:)
              forControlEvents:UIControlEventValueChanged];
}

- (void)setPageViewController:(UIPageViewController *)pageViewController {
    _pageViewController = pageViewController;
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
}

@end
