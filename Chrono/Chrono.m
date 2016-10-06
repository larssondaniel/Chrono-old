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
    {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObject:[NSDate date] forKey:@"start"];
        [[[self sharedChrono] activeOperations] setObject:dict forKey:operation];
    }
}

+ (void)stop:(NSString *)operation
{
    // Operation has finished
    NSDate *currentTime = [NSDate date];
    NSMutableDictionary *timedOperations = [[[self sharedChrono] activeOperations] objectForKey:operation];
    NSDate *startTime = [timedOperations objectForKey:@"start"];
    if (startTime)
    {
        NSLog(@"%@ finished in %@", operation, [[self sharedChrono] printableTimeDifference:currentTime since:startTime]);

        NSArray *sortedArray = [timedOperations keysSortedByValueUsingComparator:^NSComparisonResult(NSDate *obj1, NSDate *obj2) {
            return [obj1 compare:obj2];
        }];

        for (NSString *key in sortedArray)
        {
            if ([key isEqualToString:@"start"])
                continue;

            NSDate *timeOfSubOperation = [timedOperations valueForKey:key];
            double relativeTimeSpent = ([timeOfSubOperation timeIntervalSince1970] - [startTime timeIntervalSince1970]) /
                                       ([currentTime timeIntervalSince1970] - [startTime timeIntervalSince1970]);
            NSLog(@"%@ - %@ at %@ (%.02f%%)", operation, key, [[self sharedChrono] printableTimeDifference:timeOfSubOperation since:startTime], relativeTimeSpent * 100);
        }


        [[[self sharedChrono] activeOperations] removeObjectForKey:operation];
        NSLog(@"---------------------------------------------");
    }
    else
    {
        NSLog(@"%@ was never started", operation);
    }
}

+ (void)addEvent:(NSString *)event forOperation:(NSString *)operation
{
    NSMutableDictionary *currentEvents = [[[self sharedChrono] activeOperations] objectForKey:operation];

    if (!currentEvents)
    {
        [self start:operation];
    }

    [[[[self sharedChrono] activeOperations] objectForKey:operation] setObject:[NSDate date] forKey:event];

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

- (NSString *)printableTimeDifference:(NSDate *)date1 since:(NSDate *)date2
{
    double timePassed = [date1 timeIntervalSinceDate:date2] * 1000; //ms

    if (timePassed < 1000)
    {
        return [NSString stringWithFormat:@"%.02f ms", timePassed];
    }

    if (timePassed / 1000 < 60)
    {
        return [NSString stringWithFormat:@"%.02f s", timePassed / 1000];
    }

    return nil;
}

@end
