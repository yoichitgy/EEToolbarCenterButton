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

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonItem;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControlButtonType;
- (IBAction)didTapBarButton:(id)sender;
- (IBAction)segmentedControlValueChanged:(id)sender;


@end
