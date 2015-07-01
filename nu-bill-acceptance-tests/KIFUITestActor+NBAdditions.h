//
//  KIFUITestActor+NBAdditions.h
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <KIF/KIF.h>

@interface KIFUITestActor (NBAdditions)

- (void)waitUntilBillsAreLoaded;
- (void)scrollToNextBillPage;

@end
