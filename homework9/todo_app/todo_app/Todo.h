//
//  Todo.h
//  todo_app
//
//  Created by Dadits on 12/20/14.
//  Copyright (c) 2014 Dadits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Todo : NSManagedObject

@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * completed;
@property (nonatomic, retain) NSString * desc;

@end
