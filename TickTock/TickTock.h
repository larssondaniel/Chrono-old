//
//  TickTock.h
//  TickTock
//
//  Created by Daniel Larsson on 03/10/2016.
//  Copyright © 2016 daniellarsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TickTock : NSObject

+ (void)tick:(NSString *)operation;

+ (void)tock:(NSString *)operation;

@end
