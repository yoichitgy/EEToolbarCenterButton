//
//  UIToolbar+EEToolbarCenterButton.m
//  EEToolbarCenterButton
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 el eleven. All rights reserved.
//

#import "UIToolbar+EEToolbarCenterButton.h"


@implementation UIToolbar (EEToolbarCenterButton)

- (BOOL)centerButtonFeatureEnabled
{
    return nil != self.centerButtonOverlay;
}

- (void)setCenterButtonFeatureEnabled:(BOOL)enabled
{
    if (self.centerButtonFeatureEnabled == enabled) {
        return;
    }
    
    if (enabled) {
        EEToolbarCenterButtonOverlay *overlay = [[[EEToolbarCenterButtonOverlay alloc] initWithFrame:self.bounds] autorelease];
        [self addSubview:overlay];
        self.clipsToBounds = NO;
    }
    else {
        [self.centerButtonOverlay removeFromSuperview];
    }
}

- (EEToolbarCenterButtonOverlay *)centerButtonOverlay
{
    EEToolbarCenterButtonOverlay *overlay = nil;
    for (UIView *subview in [self subviews]) {
        if ([subview isKindOfClass:[EEToolbarCenterButtonOverlay class]]) {
            overlay = (EEToolbarCenterButtonOverlay *)subview;
            break;
        }
    }
    return overlay;
}

@end
