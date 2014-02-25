//
// Created by Andrea Bizzotto on 25/02/2014.
// Copyright (c) 2014 Snupps. All rights reserved.
//

#import "CustomView.h"
#import "MVArrow.h"

@interface CustomView ()
@property MVArrow *arrow;
@end

@implementation CustomView

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)drawFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise {

    self.arrow = [[MVArrow alloc] initFromPoint:fromPoint toPoint:toPoint radius:radius clockwise:clockwise];
    [self setNeedsDisplay];
}

- (void)clear {
    self.arrow = nil;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    [[UIColor darkGrayColor] setFill];
    CGContextAddRect(context, rect);
    CGContextDrawPath(context, kCGPathFill);

    if (self.arrow)
        [self.arrow draw];
}

- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
    CGPoint location = [recognizer locationInView:recognizer.view];

    [self.delegate tappedAtPosition:location];
}

@end
