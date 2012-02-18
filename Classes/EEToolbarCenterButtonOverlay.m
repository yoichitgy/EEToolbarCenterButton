//
//  EEToolbarCenterButtonOverlay.m
//  FotoFlux
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 Yoichi Tagaya. All rights reserved.
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

#import "EEToolbarCenterButtonOverlay.h"

#pragma mark EEToolbarCenterButtonItem
@implementation EEToolbarCenterButtonItem

@synthesize image = image_;
@synthesize highlightedImage = highlightedImage_;
@synthesize disabledImage = disabledImage_;
@synthesize target = target_;
@synthesize action = action_;
@synthesize enabled = enabled_;

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
      disabledImage:(UIImage *)disabledImage
             target:(id)target
             action:(SEL)action
{
    self = [super init];
    if (nil != self) {
        image_ = [image retain];
        highlightedImage_ = nil == highlightedImage ? [image retain] : [highlightedImage retain];
        disabledImage_ = nil == disabledImage ? [image retain] : [disabledImage retain];
        target_ = target;
        action_ = action;
        enabled_ = YES;
    }
    return self;
}

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
             target:(id)target
             action:(SEL)action
{
    return [self initWithImage:image
              highlightedImage:highlightedImage
                 disabledImage:image
                        target:target
                        action:action];
}

- (void)dealloc
{
    [image_ release];
    [highlightedImage_ release];
    [disabledImage_ release];
    // Do not release target_ and action_.
    [super dealloc];
}

@end


#pragma mark - EEToolbarCenterButtonOverlay
@implementation EEToolbarCenterButtonOverlay

@synthesize buttonItem = buttonItem_;

- (id)init
{
    return [self initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (nil != self) {
        self.clipsToBounds = NO;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)dealloc
{
    [buttonItem_ removeObserver:self forKeyPath:@"enabled"];
    [buttonItem_ release];
    [button_ release];
    [super dealloc];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return nil == button_ ? NO : CGRectContainsPoint(button_.frame, point);
}

- (void)setButtonItem:(EEToolbarCenterButtonItem *)item
{
    if (item != buttonItem_) {
        [buttonItem_ removeObserver:self forKeyPath:@"enabled"];
        [buttonItem_ release];
    }
    buttonItem_ = [item retain];
    [buttonItem_ addObserver:self forKeyPath:@"enabled" options:NSKeyValueObservingOptionNew context:NULL];
    
    [button_ removeFromSuperview];
    [button_ release];
    if (nil != buttonItem_) {
        CGSize buttonSize = buttonItem_.image.size;
        button_ = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        button_.opaque = YES;
        button_.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin
                                  | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
        button_.frame = CGRectMake(0.0f, 0.0f, buttonSize.width, buttonSize.height);
        [button_ setBackgroundImage:buttonItem_.image forState:UIControlStateNormal];
        [button_ setBackgroundImage:buttonItem_.highlightedImage forState:UIControlStateHighlighted];
        [button_ setBackgroundImage:buttonItem_.disabledImage forState:UIControlStateDisabled];
        [button_ addTarget:buttonItem_.target action:buttonItem_.action forControlEvents:UIControlEventTouchUpInside];
        button_.enabled = buttonItem_.enabled;
        
        CGFloat heightDifference = MAX(0.0f, buttonSize.height - self.frame.size.height);
        CGPoint center = CGPointMake(self.center.x, (self.frame.size.height - heightDifference) / 2.0f);
        button_.center = center;
        
        [self addSubview:button_];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqual:@"enabled"]) {
        NSNumber *enabled = [change objectForKey:NSKeyValueChangeNewKey];
        button_.enabled = [enabled boolValue];
    }
}

@end
