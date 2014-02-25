/*
 DemoViewController.m
 Copyright (c) 2014 Andrea Bizzotto bizz84@gmail.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "DemoViewController.h"
#import "MVArrowOverlayView.h"

@interface DemoViewController ()
@property(strong, nonatomic) IBOutlet UILabel *infoLabel;
@property(strong, nonatomic) IBOutlet UIButton *doSomethingButton;
@property(strong, nonatomic) IBOutlet MVArrowOverlayView *overlayView;

- (IBAction)doSomethingButtonPressed:(UIButton *)sender;

@property BOOL overlayVisible;
@end

@implementation DemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    self.overlayView.activeClearColor = [UIColor colorWithWhite:0.8f alpha:0.9f];
    self.overlayView.arrowStrokeColor = [UIColor blackColor];
}

- (IBAction)doSomethingButtonPressed:(UIButton *)sender {

    self.overlayVisible = !self.overlayVisible;

    [self updateOverlay];
}

- (void)updateOverlay
{
    self.overlayView.backgroundColor = self.overlayVisible ? self.overlayView.activeClearColor : [UIColor clearColor];
    if (self.overlayVisible) {
        CGRect labelRect = self.infoLabel.frame;
        CGPoint from = CGPointMake(labelRect.origin.x + labelRect.size.width, labelRect.origin.y);
        CGRect buttonRect = self.doSomethingButton.frame;
        CGPoint to = CGPointMake(buttonRect.origin.x + buttonRect.size.width/2, buttonRect.origin.y + buttonRect.size.height);

        [self.overlayView drawFromPoint:from toPoint:to radius:200 clockwise:NO];
    }
    else {
        [self.overlayView clear];
    }
}


@end
