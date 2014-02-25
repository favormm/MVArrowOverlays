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

// http://rosettacode.org/wiki/Circles_of_given_radius_through_two_points

@interface MVArrow : NSObject

- (id)initFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;

- (void)draw;

@end
