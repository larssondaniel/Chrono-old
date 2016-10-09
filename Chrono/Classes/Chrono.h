//
//  Chrono.h
//  Chrono
//
//  Created by Daniel Larsson on 03/10/2016.
//  Copyright © 2016 daniellarsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chrono : NSObject

+ (void)start:(NSString *)operation;

+ (void)stop:(NSString *)operation;

+ (void)addEvent:(NSString *)event forOperation:(NSString *)operation;

@end
