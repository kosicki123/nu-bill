//
//  NBBillControllerTests.m
//  nu-bill
//
//  Created by Diego Chohfi on 7/1/15.
//  Copyright (c) 2015 nubank. All rights reserved.
//

#import <KIF/KIF.h>
#import "KIFUITestActor+NBAdditions.h"
#import "FBSnapshotTestController.h"

@interface NBBillControllerTests : KIFTestCase

@end

@implementation NBBillControllerTests

- (UIImage *)bundledImageNamed:(NSString *)name type:(NSString *)type {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:name ofType:type];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [[UIImage alloc] initWithData:data];
}

- (void)testValidatePixelPerfectInterface {
    [tester waitUntilBillsAreLoaded];
    
    UIImage *referenceImage = [self bundledImageNamed:@"base01" type:@"png"];
    XCTAssertNotNil(referenceImage, @"");
    [system captureScreenshotWithDescription:@"tab01"];
    
    UIImage *testImage = [self bundledImageNamed:@"NBBillControllerTests.m, line 31, tab01" type:@"png"];
    XCTAssertNotNil(testImage, @"");
    FBSnapshotTestController *controller = [[FBSnapshotTestController alloc] initWithTestClass:nil];
    XCTAssertTrue([controller compareReferenceImage:referenceImage
                                            toImage:testImage
                                          tolerance:0
                                              error:nil], @"");
    
    [tester scrollToNextBillPage];
    referenceImage = [self bundledImageNamed:@"base02" type:@"png"];
    XCTAssertNotNil(referenceImage, @"");
    [system captureScreenshotWithDescription:@"tab02"];
    
    testImage = [self bundledImageNamed:@"NBBillControllerTests.m, line 44, tab02" type:@"png"];
    XCTAssertNotNil(testImage, @"");
    XCTAssertTrue([controller compareReferenceImage:referenceImage
                                            toImage:testImage
                                          tolerance:0
                                              error:nil], @"");
    
    [tester scrollToNextBillPage];
    referenceImage = [self bundledImageNamed:@"base03" type:@"png"];
    XCTAssertNotNil(referenceImage, @"");
    [system captureScreenshotWithDescription:@"tab03"];
    
    testImage = [self bundledImageNamed:@"NBBillControllerTests.m, line 56, tab03" type:@"png"];
    XCTAssertNotNil(testImage, @"");
    XCTAssertTrue([controller compareReferenceImage:referenceImage
                                            toImage:testImage
                                          tolerance:0
                                              error:nil], @"");
    
    [tester scrollToNextBillPage];
    referenceImage = [self bundledImageNamed:@"base04" type:@"png"];
    XCTAssertNotNil(referenceImage, @"");
    [system captureScreenshotWithDescription:@"tab04"];
    
    testImage = [self bundledImageNamed:@"NBBillControllerTests.m, line 68, tab04" type:@"png"];
    XCTAssertNotNil(testImage, @"");
    XCTAssertTrue([controller compareReferenceImage:referenceImage
                                            toImage:testImage
                                          tolerance:0
                                              error:nil], @"");
}

@end
