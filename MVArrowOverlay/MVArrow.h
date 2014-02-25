/*
 MVArrow.h
 Copyright (c) 2014 Andrea Bizzotto bizz84@gmail.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <Foundation/Foundation.h>

/*
 Class to draw an arrow as an arc of a circle given two points and the radius.
 */
@interface MVArrow : NSObject

/*
 @param fromPoint point where the arrow starts
 @param toPoint point where the arrow ends
 @param radius radius of circle passing between two points. If radius is too small, it is set to half the distance between the points (resulting in a semi-circle)
 @param clockwise whether the arrow direction is along the circle is clockwise or anti-clockwise
 */
- (id)initFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint radius:(CGFloat)radius clockwise:(BOOL)clockwise;

/*
 Draws the arrow. Should be called within [UIView drawRect:]
 */
- (void)draw;

/*
 Arrow color
 */
@property (strong) UIColor *arrowColor;
/*
 Line width for the arrow
 */
@property float arrowLineWidth;

@end
