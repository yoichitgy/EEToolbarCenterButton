//
//  EEViewController.h
//  EEToolbarCenterButton
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 el eleven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIToolbar+EEToolbarCenterButton.h"

@interface EEViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIToolbar *toolbar;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedControlButtonType;
- (IBAction)didTapBarButton:(id)sender;
- (IBAction)segmentedControlValueChanged:(id)sender;


@end
