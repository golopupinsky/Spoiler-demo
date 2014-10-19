//
//  SpoilerView.m
//  MyTasks
//
//  Created by Sergey Yuzepovich on 19.10.14.
//  Copyright (c) 2014 Sergey Yuzepovich. All rights reserved.
//

#import "SpoilerView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SpoilerView
{
    NSArray *_constraints;
    NSMutableArray *_srcValues;
    NSArray *_dstValues;
    CGFloat _duration;
    CGFloat _srcCornerRadius;
    CGFloat _dstCornerRadius;
    bool _isInitialState;
}

-(void)setupDuration:(CGFloat)duration constraints:(NSArray*)constraints dstValues:(NSArray*)values corners:(CGFloat)radius
{
    _constraints = constraints;
    _dstValues = values;
    _duration = duration;
    _dstCornerRadius = radius;
    
    _srcValues = [NSMutableArray arrayWithCapacity:[constraints count]];
    for (NSLayoutConstraint *c in constraints) {
        [_srcValues addObject: [NSNumber numberWithFloat:c.constant]];
    }
    
    self.layer = [CALayer layer];
    [self.layer setBackgroundColor:CGColorCreateGenericGray(0.5, 0.5)];
    self.wantsLayer = true;
    _isInitialState = true;
}


-(void)toggleState
{
    NSArray* values = _isInitialState ? _dstValues : _srcValues;
    CGFloat corners = _isInitialState ? _dstCornerRadius : _srcCornerRadius;
    
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        [context setDuration:_duration];
        [context setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut] ];
        
        int i=0;
        for (NSLayoutConstraint *c in _constraints) {
            [c animator].constant = [(NSNumber*)values[i++] floatValue];
        }
        self.layer.cornerRadius = corners;
        [self setNeedsUpdateConstraints:true];
        [self.superview layoutSubtreeIfNeeded];
    } completionHandler:^{
        _isInitialState = !_isInitialState;
        [self layoutSubtreeIfNeeded];
        [self updateConstraintsForSubtreeIfNeeded];

    }];

}

@end
