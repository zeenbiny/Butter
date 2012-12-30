//
//  BTRLabel.m
//  Butter
//
//  Created by Jonathan Willing on 12/21/12.
//  Copyright (c) 2012 ButterKit. All rights reserved.
//

#import "BTRLabel.h"

@implementation BTRLabel

- (void)commonInitForBTRLabel {
	self.bezeled = NO;
	self.editable = NO;
	self.layer.shadowRadius = 0.f;
	self.selectable = NO;
}

- (id)initWithFrame:(NSRect)frame {
	self = [super initWithFrame:frame];
	if (self == nil) return nil;
	[self commonInitForBTRLabel];
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self == nil) return nil;
	[self commonInitForBTRLabel];
	return self;
}

- (BOOL)drawsBackground {
	return NO;
}
@end
