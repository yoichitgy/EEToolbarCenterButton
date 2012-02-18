//
//  EEViewController.m
//  EEToolbarCenterButton
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 el eleven. All rights reserved.
//

#import "EEViewController.h"

@implementation EEViewController

@synthesize toolbar;
@synthesize barButtonItem;
@synthesize segmentedControlButtonType;

#pragma mark - Private methods
- (void)changeCenterButtonWithPaw:(BOOL)isPaw
{
    NSString *imageName = isPaw ? @"CenterButtonIconPaw" : @"CenterButtonIconHeart";
    NSString *highlightedImageName = isPaw ? @"CenterButtonIconPawHighlighted" : @"CenterButtonIconHeartHighlighted";
    NSString *disabledImageName = isPaw ? @"CenterButtonIconPawDisabled" : @"CenterButtonIconHeartDisabled";
    UIImage *centerButtonImage = [UIImage imageNamed:imageName];
    UIImage *centerButtonImageHighlighted = [UIImage imageNamed:highlightedImageName];
    UIImage *centerButtonImageDisabled = [UIImage imageNamed:disabledImageName];
    EEToolbarCenterButtonItem *centerButtonItem = [[[EEToolbarCenterButtonItem alloc] 
                                                    initWithImage:centerButtonImage
                                                    highlightedImage:centerButtonImageHighlighted
                                                    disabledImage:centerButtonImageDisabled
                                                    target:self
                                                    action:@selector(didTapCenterButton:)]
                                                   autorelease];
                                                   
    self.toolbar.centerButtonOverlay.buttonItem = centerButtonItem;
    
    self.barButtonItem.title = @"Disable";
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Toolbar
	self.toolbar.centerButtonFeatureEnabled = YES;
    [self changeCenterButtonWithPaw:YES];
}

- (void)viewDidUnload
{
    self.segmentedControlButtonType = nil;
    self.toolbar = nil;
    self.barButtonItem = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (void)dealloc
{
    [segmentedControlButtonType release];
    [toolbar release];
    [barButtonItem release];
    [super dealloc];
}

#pragma mark - Event handlers
- (void)didTapCenterButton:(id)sender
{
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Tapped"
                                                     message:@"Center button was tapped."
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"Dismiss", nil]
                          autorelease];
    [alert show];
}

- (IBAction)didTapBarButton:(id)sender 
{
    self.toolbar.centerButtonOverlay.buttonItem.enabled = !self.toolbar.centerButtonOverlay.buttonItem.enabled;
    self.barButtonItem.title = self.toolbar.centerButtonOverlay.buttonItem.enabled ? @"Disable" : @"Enable";
}

- (IBAction)segmentedControlValueChanged:(id)sender
{
    BOOL isPaw = self.segmentedControlButtonType.selectedSegmentIndex == 0;
    [self changeCenterButtonWithPaw:isPaw];
}
@end
