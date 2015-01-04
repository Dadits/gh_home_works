//
//  PageItemController.m
//  evernote
//
//  Created by Dadits on 1/4/15.
//  Copyright (c) 2015 Dadits. All rights reserved.
//

#import "PageItemController.h"

@interface PageItemController ()

@end

@implementation PageItemController
@synthesize itemIndex;
@synthesize imageName;
@synthesize contentImageView;

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    contentImageView.image = [UIImage imageNamed: imageName];
}

#pragma mark -
#pragma mark Content

- (void) setImageName: (NSString *) name
{
    imageName = name;
    contentImageView.image = [UIImage imageNamed: imageName];
}

@end

