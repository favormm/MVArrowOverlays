//
// Created by Andrea Bizzotto on 25/02/2014.
// Copyright (c) 2014 Snupps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MVArrowOverlayDelegate <NSObject>
- (void)tappedAtPosition:(CGPoint)position;
@end

@interface MVArrowOverlayView : UIView

- (void)drawFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;
- (void)clear;

@property(strong, nonatomic) UIColor *activeClearColor;
@property(strong, nonatomic) UIColor *inactiveClearColor;
@property(strong, nonatomic) UIColor *arrowStrokeColor;

@property(weak, nonatomic) id<MVArrowOverlayDelegate> delegate;
@end