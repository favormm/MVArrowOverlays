/*
 DrawViewController.m
 Copyright (c) 2014 Andrea Bizzotto bizz84@gmail.com

 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


#import "DrawViewController.h"
#import "MVArrowOverlayView.h"

@interface DrawViewController ()<MVArrowOverlayDelegate>
@property(strong, nonatomic) IBOutlet MVArrowOverlayView *tappableView;
@property(strong, nonatomic) IBOutlet UISlider *slider;
@property(strong, nonatomic) IBOutlet UISwitch *clockwiseSwitch;
@property(strong, nonatomic) IBOutlet UILabel *sliderLabel;

@property(strong, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)clockwiseSwitchChanged:(UISwitch *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;
- (IBAction)clearButtonPressed:(UIButton *)sender;

@property float maxRadius;
@property (nonatomic) NSUInteger numTaps;
@property CGPoint firstTapPosition;
@property CGPoint secondTapPosition;
@end

@implementation DrawViewController

- (void)viewDidLoad
{
    self.tappableView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    CGSize viewSize = self.view.bounds.size;
    self.maxRadius = sqrtf(viewSize.width * viewSize.width + viewSize.height * viewSize.height);

    self.currentRadius = self.maxRadius / 2;
    self.numTaps = 0;

    self.tappableView.activeClearColor = [UIColor whiteColor];
    self.tappableView.arrowStrokeColor = [UIColor blackColor];
}
#pragma mark - actions

- (IBAction)sliderValueChanged:(UISlider *)sender {

    float currentRadius = self.maxRadius * sender.value;
    self.sliderLabel.text = [NSString stringWithFormat:@"Radius: %.0f", currentRadius];

    [self updateArrow];
}

- (IBAction)clockwiseSwitchChanged:(UISwitch *)sender {

    [self updateArrow];
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    self.numTaps = 0;
}

#pragma mark - logic
- (void)setCurrentRadius:(float)currentRadius
{
    float ratio = currentRadius / self.maxRadius;
    self.slider.value = ratio;

    self.sliderLabel.text = [NSString stringWithFormat:@"Radius: %.0f", currentRadius];
}


- (void)setNumTaps:(NSUInteger)numTaps
{
    _numTaps = numTaps;
    self.statusLabel.text = [self stringForState];

    [self updateArrow];
    if (numTaps < 2) {
        [self.tappableView clear];
    }
}

- (void)updateArrow {

    if (self.numTaps == 2) {
        float currentRadius = self.maxRadius * self.slider.value;
        [self.tappableView drawFromPoint:self.firstTapPosition toPoint:self.secondTapPosition radius:currentRadius clockwise:self.clockwiseSwitch.on];
    }
}

- (NSString *)stringForState {

    switch (self.numTaps) {
        default:
        case 0:
            return @"Tap 2 points to draw arrow";
        case 1:
            return [NSString stringWithFormat:@"First:{%.0f, %.0f}, tap second", self.firstTapPosition.x, self.firstTapPosition.y];
        case 2:
            return [NSString stringWithFormat:@"Arc[{%.0f, %.0f}, {%.0f, %.0f}]", self.firstTapPosition.x, self.firstTapPosition.y, self.secondTapPosition.x, self.secondTapPosition.y];
    }
}

#pragma mark - CustomViewDelegate
- (void)tappedAtPosition:(CGPoint)position {

    if (self.numTaps == 0) {
        self.firstTapPosition = position;
        self.numTaps++;
        return;
    }
    if (self.numTaps == 1) {
        self.secondTapPosition = position;
        self.numTaps++;
        return;
    }
    if (self.numTaps == 2) {
        self.firstTapPosition = position;
        self.numTaps = 1;
        return;
    }
}


@end
