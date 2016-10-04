//
//  TickTock.m
//  TickTock
//
//  Created by Daniel Larsson on 03/10/2016.
//  Copyright © 2016 daniellarsson. All rights reserved.
//

#import "TickTock.h"

@interface TickTock ()

@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSString *currentOperation;

@end

@implementation TickTock

+ (TickTock*)sharedTickTock
{
    static dispatch_once_t once;

    static TickTock *sharedTickTock;

    dispatch_once(&once, ^{ sharedTickTock = [[TickTock alloc] init]; });

    return sharedTickTock;
}

+ (void)tick:(NSString *)operation
{
    // Operation began
    [[self sharedTickTock] setCurrentOperation:operation];
    [[self sharedTickTock] setStartTime:[NSDate date]];
}

+ (void)tock
{
    // Operation has finished
    NSLog(@"%@ finished in %f ms", [[self sharedTickTock] currentOperation], -[[[self sharedTickTock] startTime] timeIntervalSinceNow] * 1000);
}

@end
