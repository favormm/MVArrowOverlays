//
//  MVArrow.h
//  MVArrowOverlays
//
//  Created by Andrea Bizzotto on 25/02/2014.
//  Copyright (c) 2014 Snupps. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Circle: Center, radius, a1, a2

 */


@interface MVArrow : NSObject

- (id)initFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;

- (void)draw;

@property (strong) UIColor *strokeColor;
@property float strokeWidth;

@end
