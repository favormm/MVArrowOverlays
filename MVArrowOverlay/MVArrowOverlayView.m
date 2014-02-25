//
// Created by Andrea Bizzotto on 25/02/2014.
// Copyright (c) 2014 Snupps. All rights reserved.
//

#import "MVArrowOverlayView.h"
#import "MVArrow.h"

@interface MVArrowOverlayView ()
@property MVArrow *arrow;
@end

@implementation MVArrowOverlayView

- (void)awakeFromNib
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self addGestureRecognizer:tapGestureRecognizer];

    self.activeClearColor = [UIColor whiteColor];
    self.inactiveClearColor = [UIColor whiteColor];
}

- (void)drawFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise {

    self.arrow = [[MVArrow alloc] initFromPoint:fromPoint toPoint:toPoint radius:radius clockwise:clockwise];
    self.arrow.strokeColor = self.arrowStrokeColor;
    [self setNeedsDisplay];
}

- (void)clear {
    self.arrow = nil;
    [self setNeedsDisplay];
}

- (void)setArrowStrokeColor:(UIColor *)arrowStrokeColor
{
    _arrowStrokeColor = arrowStrokeColor;
    if (self.arrow) {
        self.arrow.strokeColor = arrowStrokeColor;
        [self setNeedsDisplay];
    }
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    UIColor *colorToUse = self.arrow ? self.activeClearColor : self.inactiveClearColor;
    [colorToUse setFill];
    CGContextAddRect(context, rect);
    CGContextDrawPath(context, kCGPathFill);

    if (self.arrow)
        [self.arrow draw];
}

- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
    //Code to handle the gesture
    CGPoint location = [recognizer locationInView:recognizer.view];

    if ([self.delegate respondsToSelector:@selector(tappedAtPosition:)])
        [self.delegate tappedAtPosition:location];
}

@end
