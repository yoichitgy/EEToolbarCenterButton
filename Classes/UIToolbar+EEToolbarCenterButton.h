//
//  UIToolbar+EEToolbarCenterButton.h
//  EEToolbarCenterButton
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 el eleven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EEToolbarCenterButtonOverlay.h"

@interface UIToolbar (EEToolbarCenterButton)

@property (nonatomic, readwrite) BOOL centerButtonFeatureEnabled;
@property (nonatomic, readonly ) EEToolbarCenterButtonOverlay *centerButtonOverlay;

@end