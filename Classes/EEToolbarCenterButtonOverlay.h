//
//  EEToolbarCenterButtonOverlay.h
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

#import <UIKit/UIKit.h>

#pragma mark EEToolbarCenterButtonItem
@interface EEToolbarCenterButtonItem : NSObject
{
 @private
    UIImage *image_;
    UIImage *highlightedImage_;
    UIImage *disabledImage_;
    id target_;
    SEL action_;
    BOOL enabled_;
}

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) UIImage *highlightedImage;
@property (nonatomic, readonly) UIImage *disabledImage;
@property (nonatomic, readonly) id target;
@property (nonatomic, readonly) SEL action;
@property (nonatomic, readwrite) BOOL enabled;

- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
      disabledImage:(UIImage *)disabledImage
             target:(id)target
             action:(SEL)action;
- (id)initWithImage:(UIImage *)image
   highlightedImage:(UIImage *)highlightedImage
             target:(id)target
             action:(SEL)action;

@end


#pragma mark - EEToolbarCenterButtonOverlay
@interface EEToolbarCenterButtonOverlay : UIView
{
 @private
    EEToolbarCenterButtonItem *buttonItem_;
    UIButton *button_;
}

@property (nonatomic, retain) EEToolbarCenterButtonItem *buttonItem;
- (id)init;

@end
