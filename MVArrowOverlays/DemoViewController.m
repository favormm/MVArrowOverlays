//
//  DemoViewController.m
//  MVArrowOverlays
//
//  Created by Andrea Bizzotto on 25/02/2014.
//  Copyright (c) 2014 Snupps. All rights reserved.
//

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
