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
    [Chrono start:@"heavyTask"];

    [Chrono subOperation:@"firstPart" operation:@"heavyTask"];
    [Chrono subOperation:@"secondPart" operation:@"heavyTask"];
    [Chrono subOperation:@"thirdPart" operation:@"heavyTask"];

    // Do some things

    [Chrono stop:@"readQRCode"];
    [Chrono stop:@"heavyTask"];
}

- (void)testThreadedChrono
{
    [Chrono start:@"threadedTask"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [Chrono stop:@"threadedTask"];
    });
}

@end
