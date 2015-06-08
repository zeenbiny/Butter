//
//  BTRPopUpButton.h
//  Butter
//
//  Created by Indragie Karunaratne on 2012-12-30.
//  Copyright (c) 2012 ButterKit. All rights reserved.
//

#import "BTRControl.h"

@interface BTRPopUpButton : BTRControl

// The pop up button's menu.
@property IBOutlet NSMenu *menu;

// The selected item whose title is being currently displayed in
// the pop up button.
@property (nonatomic, strong) NSMenuItem *selectedItem;

// Whether the pop up button automatically calls -setEnabled: on all
// menu items before displaying the menu.
@property (nonatomic, assign) BOOL autoenablesItems;

// Alignment of the text in the pop up button label.
@property (nonatomic, assign) NSTextAlignment textAlignment;

- (void)selectItemAtIndex:(NSUInteger)index;
@property (readonly) NSUInteger indexOfSelectedItem;

// Adjust the width of the view to fit the content
- (void)sizeToFit;

- (NSImage *)arrowImageForControlState:(BTRControlState)state;
- (void)setArrowImage:(NSImage *)image forControlState:(BTRControlState)state;

// Can be overriden by subclasses to customize layout
// The frame of the image view 
@property (readonly) NSRect imageFrame;

// The frame of the text label
@property (readonly) NSRect labelFrame;

// The frame of the arrow image view
@property (readonly) NSRect arrowFrame;

// The padding between each element (between image and label, and label and arrow)
@property (readonly) CGFloat interElementSpacing;

// The distance between the pop up button content and the view edges
@property (readonly) CGFloat edgeInset;

// The width to fit all the content in the view (used by -sizeToFit)
@property (readonly) CGFloat widthToFit;

// Returns the arrow image for the current `BTRControlState`
@property (nonatomic, strong, readonly) NSImage *currentArrowImage;

@end
