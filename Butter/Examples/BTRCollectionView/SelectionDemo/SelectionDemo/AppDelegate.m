//
//  AppDelegate.m
//  SelectionDemo
//
//  Created by Jonathan Willing on 12/12/12.
//  Copyright (c) 2012 ButterKit. All rights reserved.
//  Images used are from PSTCollectionView
//

#import "AppDelegate.h"
#import <Butter/RBLScrollView.h>
#import <Butter/NSView+RBLAnimationAdditions.h>
#import "Cell.h"

@interface AppDelegate()
@property (nonatomic, strong) BTRCollectionView *collectionView;
@end

@implementation AppDelegate

- (void)awakeFromNib {
	NSView *view = [self.window contentView];
	RBLScrollView *scrollView = [[RBLScrollView alloc] initWithFrame:view.bounds];
	scrollView.hasHorizontalScroller = NO;
    scrollView.hasVerticalScroller = YES;
    scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
	
	BTRCollectionViewFlowLayout *flowLayout = [[BTRCollectionViewFlowLayout alloc] init];
    self.collectionView = [[BTRCollectionView alloc] initWithFrame:scrollView.bounds collectionViewLayout:flowLayout];
    self.collectionView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
	[self.collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"MY_CELL"];
	[self.collectionView setDataSource:self];
	[self.collectionView setDelegate:self];
	scrollView.documentView = _collectionView;
	[view addSubview:scrollView];
}

- (BTRCollectionViewCell *)collectionView:(BTRCollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
	cell.label.stringValue = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
	//cell.contentView.layer.contents = [NSImage imageNamed:[NSString stringWithFormat:@"%d",(arc4random() % (32))]];
	cell.imageView.image = [NSImage imageNamed:[NSString stringWithFormat:@"%d",(arc4random() % (32))]];
	
    return cell;
}

- (CGSize)collectionView:(BTRCollectionViewCell *)collectionView layout:(BTRCollectionViewCell *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(180, 140);
}

- (NSInteger)collectionView:(BTRCollectionViewCell *)view numberOfItemsInSection:(NSInteger)section {
    return 5000;
}

- (BOOL)collectionView:(BTRCollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%s",__PRETTY_FUNCTION__);
	return YES;
}

- (void)collectionView:(BTRCollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%s",__PRETTY_FUNCTION__);
}

- (void)collectionView:(BTRCollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%s",__PRETTY_FUNCTION__);
	BTRCollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
	[NSView rbl_animateWithDuration:0.1 animationCurve:RBLViewAnimationCurveEaseInOut animations:^{
		cell.layer.transform = CATransform3DConcat(CATransform3DMakeScale(0.9, 0.9, 0.0), CATransform3DMakeTranslation(9, 9, 0));
	} completion:^{
		[NSView rbl_animateWithDuration:0.2 animationCurve:RBLViewAnimationCurveEaseOut animations:^{
			cell.layer.transform = CATransform3DIdentity;
		} completion:NULL];
	}];
}

- (void)collectionView:(BTRCollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end
