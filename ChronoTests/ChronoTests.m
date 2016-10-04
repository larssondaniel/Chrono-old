//
//  ChronoTest.m
//  ChronoTests
//
//  Created by Daniel Larsson on 03/10/2016.
//  Copyright © 2016 daniellarsson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Chrono.h"

@interface ChronoTests : XCTestCase

@end

@implementation ChronoTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testChrono
{
    [Chrono start:@"readQRCode"];
    [Chrono start:@"doMassiveAmountsOfWork"];

    // Do some things

    [Chrono stop:@"readQRCode"];
    [Chrono stop:@"doMassiveAmountsOfWork"];
}

- (void)testThreadedChrono
{
    [Chrono start:@"doSomething"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [Chrono stop:@"doSomething"];
    });
}

@end
