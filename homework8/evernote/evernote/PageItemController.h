//
//  PageItemController.h
//  evernote
//
//  Created by Dadits on 1/4/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageItemController : UIViewController

@property (nonatomic) NSUInteger itemIndex;
@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;

@end
