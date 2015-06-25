//
//  NBSegmentedDelegateDatasource.h
//  nu-bill
//
//  Created by Diego Chohfi on 6/24/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DZNSegmentedControl.h"

@interface NBSegmentedDelegateDatasource : NSObject

@property (nonatomic, strong, readonly) DZNSegmentedControl *segmentControl;

- (instancetype)initWitPageViewController:(UIPageViewController *)pageViewController
                          viewControllers:(NSArray *)viewControllers
                           segmentControl:(DZNSegmentedControl *)segmentControl;

@end
