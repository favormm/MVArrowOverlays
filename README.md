
MVArrowOverlays - Andrea Bizzotto <bizz84@gmail.com>

-------------------------------------------------------

This project includes a class to draw an arrow as an arc of a circle given two points and the radius. This is well suited for first time user experiences in order to focus the attention of the user on a particular control or button.

USAGE

MVArrow can be initialised with two points and a radius and provides a draw method to be called within a [UIView drawRect:] method.

<pre>
- (void)drawRect:(CGRect)rect {

    MVArrow *arrow = [[MVArrow alloc] initFromPoint:fromPoint toPoint:toPoint radius:100 clockwise:YES];
    [arrow draw];
}
</pre>

A sample application demonstrating the usage MVArrow is included.

License information can be found in the LICENSE.md file.

![MVArrow preview](https://github.com/bizz84/MVArrowOverlays/raw/master/preview.png "MVArrow preview")
