//
//  Chrono.m
//  Chrono
//
//  Created by Daniel Larsson on 03/10/2016.
//  Copyright © 2016 daniellarsson. All rights reserved.
//

#import "Chrono.h"

@interface Chrono ()

@property (nonatomic) NSMutableDictionary *activeOperations;

@end

@implementation Chrono

+ (Chrono *)sharedChrono
{
    static dispatch_once_t once;

    static Chrono *sharedChrono;

    dispatch_once(&once, ^{ sharedChrono = [[Chrono alloc] init]; });

    return sharedChrono;
}

+ (void)start:(NSString *)operation
{
    // Operation began
    if (operation)
        [[[self sharedChrono] activeOperations] setObject:[NSDate date] forKey:operation];
}

+ (void)stop:(NSString *)operation
{
    // Operation has finished
    NSDate *currentTime = [NSDate date];
    NSDate *startTime = [[[self sharedChrono] activeOperations] objectForKey:operation];
    if (startTime)
    {
        double timePassed = [currentTime timeIntervalSinceDate:startTime] * 1000;
        NSLog(@"%@ finished in %@", operation, [[self sharedChrono] printableTime:timePassed]);
        [[[self sharedChrono] activeOperations] removeObjectForKey:operation];
    }
    else
    {
        NSLog(@"%@ was never started", operation);
    }
}


#pragma mark - Instance methods

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.activeOperations = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSString *)printableTime:(double)milliseconds
{
    if (milliseconds < 1)
    {
        return [NSString stringWithFormat:@"%f µs", milliseconds * 1000];
    }

    if (milliseconds < 1000)
    {
        return [NSString stringWithFormat:@"%f ms", milliseconds];
    }

    if (milliseconds / 1000 < 60)
    {
        return [NSString stringWithFormat:@"%f s", milliseconds / 1000];
    }

    return nil;
}

@end
