//
//  SpoilerView.h
//  MyTasks
//
//  Created by Sergey Yuzepovich on 19.10.14.
//  Copyright (c) 2014 Sergey Yuzepovich. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SpoilerView : NSView

-(void)setupDuration:(CGFloat)duration constraints:(NSArray*)constraints dstValues:(NSArray*)values corners:(CGFloat)radius;
-(void)toggleState;

@end
