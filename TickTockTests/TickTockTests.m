//
//  TickTockTests.m
//  TickTockTests
//
//  Created by Daniel Larsson on 03/10/2016.
//  Copyright © 2016 daniellarsson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TickTock.h"

@interface TickTockTests : XCTestCase

@end

@implementation TickTockTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testTickTock
{
    [TickTock tick:@"readQRCode"];
    [TickTock tick:@"doMassiveAmountsOfWork"];

    // Do some things

    [TickTock tock:@"readQRCode"];
    [TickTock tock:@"doMassiveAmountsOfWork"];
}

- (void)testThreadedTickTock
{
    [TickTock tick:@"doSomething"];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [TickTock tock:@"doSomething"];
    });
}

@end
