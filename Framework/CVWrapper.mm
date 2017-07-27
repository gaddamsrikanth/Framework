
//  CVWrapper.m
//  TriviaGames
//
//  Created by developer91 on 12/17/16.
//  Copyright © 2016 developer93. All rights reserved.
//

#import "CVWrapper.h"
#import "ObjectRecoViewController.h"
#import "ObjectRecoEAGLView.h"
#import "CloudRecoViewController.h"
#import "CloudRecoEAGLView.h"
//#import "TriviaGames-Swift.h"

@implementation CVWrapper


- (UIViewController *) beginProcess
{
    NSBundle* resourcesBundle = [NSBundle bundleForClass:[CloudRecoViewController class]];
    CloudRecoViewController *vc= [[CloudRecoViewController alloc]
        initWithNibName:@"CloudRecoViewController" bundle: resourcesBundle];
    return (vc);
} 

- (NSBundle *) getBundle
{
    NSBundle* resourcesBundle = [NSBundle bundleForClass:[CloudRecoViewController class]];
    return resourcesBundle;
}

- (NSString *) navigateName
{
    CloudRecoViewController *obj = [[CloudRecoViewController alloc]init];
    return (obj->imgName);
}

@end
