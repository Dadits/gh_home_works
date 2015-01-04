//
//  GHCar.m
//  homework2
//
//  Created by Dadits on 1/4/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#include "GHCar.h"

@implementation GHCar

- (id) initWithEngineCapacity:(float)capacity andHorsePower:(int)horsePower
{
    self = [super init];
    if (self)
    {
        GHEngine * newEngine = [[GHEngine alloc] init];
        newEngine.capacity = capacity;
        newEngine.horsePower = horsePower;
        
        _engine = newEngine;
    }
    return self;
}


- (void) printCarIformation
{
    NSLog(@"%@ (%.01f) - %i h/p, max. speed - %.0f", self.mark,
          [_engine capacity],
          _engine.horsePower,
          self.topSpeed);
}

- (BOOL) isFasterThanCar:(GHCar *)carToCompare
{
    return self.topSpeed > carToCompare.topSpeed;
}

@end
