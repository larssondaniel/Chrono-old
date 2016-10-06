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
    [Chrono start:@"foo"];
    sleep(2);
    [Chrono addEvent:@"firstPart" forOperation:@"foo"];
    sleep(1);
    [Chrono addEvent:@"secondPart" forOperation:@"foo"];
    sleep(1);
    [Chrono addEvent:@"thirdPart" forOperation:@"foo"];

    [Chrono stop:@"foo"];
}

- (void)testThreadedChrono
{
    [Chrono start:@"threadedTask"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [Chrono stop:@"threadedTask"];
    });
}

@end
