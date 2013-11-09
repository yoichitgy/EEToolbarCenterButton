EEToolbarCenterButton
=============

EEToolbarCenterButton is a component to add a featured button to the center of UIToolbar. It handles button alignment, and helps you use button images whose height is larger than UIToolbar height.

![Screenshot](https://raw.github.com/el-eleven/EEToolbarCenterButton/master/Images/Screenshot.jpg)

Supported Environment
-----------
iOS 5 or later with ARC.

Installation
-----------
EEToolbarCenterButton can be installed by [CocoaPods](http://cocoapods.org/) with your Podfile containing the following line.

    pod 'EEToolbarCenterButton'

Or, just copy files in the Classes directory to your project.

Usage
-----------

The usage of the center button feature is quite similar to that of UIToolbar with UIBarButtonItem. First, import "UIToolbar+EEToolbarCenterButton.h" and turn on the center button feature:

	#import "UIToolbar+EEToolbarCenterButton.h"
	
	...
	
	self.toolbar.centerButtonFeatureEnabled = YES;

Then create an EEToolbarCenterButtonItem with custom images and an action selector:

    UIImage *centerButtonImage = [UIImage imageNamed:@"ButtonImage"];
    UIImage *centerButtonImageHighlighted = [UIImage imageNamed:@"HighlightedButtonImage"];
    UIImage *centerButtonImageDisabled = [UIImage imageNamed:@"DisabledButtonImage"];
    EEToolbarCenterButtonItem *centerButtonItem = [[EEToolbarCenterButtonItem alloc] 
                                                    initWithImage:centerButtonImage
                                                    highlightedImage:centerButtonImageHighlighted
                                                    disabledImage:centerButtonImageDisabled
                                                    target:self
                                                    action:@selector(didTapCenterButton:)];

At last apply the button to centerButtonOverlay property of UIToolbar added by EEToolbarCenterButton category:

    self.toolbar.centerButtonOverlay.buttonItem = centerButtonItem;

Now you find a cool button at the center of UIToolbar. You can enable/disable the center button like a UIBarButtonItem:

    centerButtonItem.enabled = NO;
    
Customization
-----------

Creating your own button images makes your app unique. The following website lists a number of tutorials to make cool buttons with Photoshop:

http://naldzgraphics.net/tutorials/40-best-photoshop-tutorials-for-creating-buttons-and-badges/

Credits
-----------

Feel free to send pull requests or create new issues if you have feature suggestions or bug reports. If you're going to use EEToolbarCenterButton in your project, proper attribution would be nice.
