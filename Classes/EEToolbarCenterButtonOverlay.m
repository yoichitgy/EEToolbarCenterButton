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

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
      disabledImage:(UIImage *)disabledImage
             target:(id)target
             action:(SEL)action
{
    self = [super init];
    if (nil != self) {
        _image = image;
        _highlightedImage = nil == highlightedImage ? image : highlightedImage;
        _disabledImage = nil == disabledImage ? image : disabledImage;
        _target = target;
        _action = action;
        self.enabled = YES;
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

@end


#pragma mark - EEToolbarCenterButtonOverlay
@interface EEToolbarCenterButtonOverlay ()

@property (nonatomic, strong) UIButton *button;

@end


@implementation EEToolbarCenterButtonOverlay

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
    [self.buttonItem removeObserver:self forKeyPath:@"enabled"];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return nil == self.button ? NO : CGRectContainsPoint(self.button.frame, point);
}

- (void)setButtonItem:(EEToolbarCenterButtonItem *)item
{
    [self.buttonItem removeObserver:self forKeyPath:@"enabled"];
    _buttonItem = item;
    [self.buttonItem addObserver:self forKeyPath:@"enabled" options:NSKeyValueObservingOptionNew context:NULL];
    
    [self.button removeFromSuperview];
    if (nil != self.buttonItem) {
        CGSize buttonSize = self.buttonItem.image.size;
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.opaque = YES;
        self.button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin
                                       | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
        self.button.frame = CGRectMake(0.0f, 0.0f, buttonSize.width, buttonSize.height);
        [self.button setBackgroundImage:self.buttonItem.image forState:UIControlStateNormal];
        [self.button setBackgroundImage:self.buttonItem.highlightedImage forState:UIControlStateHighlighted];
        [self.button setBackgroundImage:self.buttonItem.disabledImage forState:UIControlStateDisabled];
        [self.button addTarget:self.buttonItem.target action:self.buttonItem.action forControlEvents:UIControlEventTouchUpInside];
        self.button.enabled = self.buttonItem.enabled;
        
        CGFloat heightDifference = MAX(0.0f, buttonSize.height - self.frame.size.height);
        CGPoint center = CGPointMake(self.center.x, (self.frame.size.height - heightDifference) / 2.0f);
        self.button.center = center;
        
        [self addSubview:self.button];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqual:@"enabled"]) {
        NSNumber *enabled = [change objectForKey:NSKeyValueChangeNewKey];
        self.button.enabled = [enabled boolValue];
    }
}

@end
