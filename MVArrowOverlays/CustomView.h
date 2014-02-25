//
// Created by Andrea Bizzotto on 25/02/2014.
// Copyright (c) 2014 Snupps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomViewDelegate
- (void)tappedAtPosition:(CGPoint)position;
@end

@interface CustomView : UIView

- (void)drawFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;
- (void)clear;

@property(weak, nonatomic) id<CustomViewDelegate> delegate;
@end