//
//  EEToolbarCenterButtonOverlay.h
//  FotoFlux
//
//  Created by Yoichi Tagaya on 12/02/18.
//  Copyright (c) 2012 Yoichi Tagaya. All rights reserved.
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
