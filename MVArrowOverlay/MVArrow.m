//
//  MVArrow.m
//  MVArrowOverlays
//
//  Created by Andrea Bizzotto on 25/02/2014.
//  Copyright (c) 2014 Snupps. All rights reserved.
//

#import "MVArrow.h"


#include<stdio.h>
#include<math.h>


CGFloat distance(CGPoint p1, CGPoint p2)
{
    return sqrtf((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y));
}

CGPoint findCircle(CGPoint p1, CGPoint p2, CGFloat radius)
{
    // TODO: Assert non valid types
    CGFloat separation = distance(p1,p2);

    // No circle or infinite circles
    if (separation == 0.0f) {
        return p1;
    }

    // points are opposite ends circle with given radius
    if(separation == 2*radius) {
        return CGPointMake((p1.x+p2.x)/2, (p1.y+p2.y)/2);
    }

    // points too far
    if(separation > 2*radius) {
        return CGPointZero;
    }

    float mirrorDistance = sqrtf(radius * radius - separation * separation / 4);
    return CGPointMake((p1.x+p2.x)/2 + mirrorDistance*(p1.y-p2.y)/separation, (p1.y+p2.y)/2 + mirrorDistance*(p2.x-p1.x)/separation);
    // (p1.x+p2.x)/2 - mirrorDistance*(p1.y-p2.y)/separation,(p1.y+p2.y)/2 - mirrorDistance*(p2.x-p1.x)/separation
}

float findAngle(CGPoint from, CGPoint to) {

    float dy = to.y - from.y;
    float dx = to.x - from.x;
    return atan2f(dy, dx);
}

@interface MVArrow()
@property CGPoint circleCenter;
@property CGFloat radius;
@property BOOL clockwise;
@property float startAngle;
@property float endAngle;

@end

@implementation MVArrow


- (id)initFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise {

    if (self = [super init]) {

        self.circleCenter = findCircle(fromPoint, toPoint, radius);
        self.radius = radius;
        self.clockwise = clockwise;
        self.startAngle = findAngle(self.circleCenter, fromPoint);
        self.endAngle = findAngle(self.circleCenter, toPoint);
    }
    return self;
}

- (void)draw {

    UIBezierPath *arc = [UIBezierPath bezierPath];
    [arc addArcWithCenter:self.circleCenter radius:self.radius startAngle:self.startAngle endAngle:self.endAngle clockwise:self.clockwise];
    [arc setLineWidth:4.0];
    [arc stroke];
}

@end
