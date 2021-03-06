//
//  GHCar.h
//  homework2
//
//  Created by Dadits on 1/4/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GHEngine.h"

@interface GHCar : NSObject

@property (nonatomic) NSString * mark; // Марка машины пример - BMW.
@property (nonatomic) float topSpeed; // Макс. скорость пример - 230 км/час
@property (nonatomic, readonly) GHEngine * engine; // Двигатель

- (id) initWithEngineCapacity:(float)capacity andHorsePower:(int)horsePower;

-(void) printCarIformation; // выводит инфу о машине пример - "BMW (2.5) - 192 h/p, max. speed - 230"
-(BOOL) isFasterThanCar:(GHCar *)carToCompare; //сравнивает макс. скорость машин

@end
