//
//  CVWrapper.h
//  TriviaGames
//
//  Created by developer91 on 12/17/16.
//  Copyright © 2016 developer93. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SampleGLResourceHandler.h"
//@class QuestionsVC;

@interface CVWrapper : NSObject

@property (nonatomic, weak) id<SampleGLResourceHandler> glResourceHandler;
-(UIViewController *) beginProcess;
-(NSString *) navigateName;
-(NSBundle *) getBundle;
@end
