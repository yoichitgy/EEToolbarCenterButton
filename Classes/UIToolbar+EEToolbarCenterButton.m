//
//  UIToolbar+EEToolbarCenterButton.m
//  EEToolbarCenterButton
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 el eleven. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
        EEToolbarCenterButtonOverlay *overlay = [[EEToolbarCenterButtonOverlay alloc] initWithFrame:self.bounds];
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
