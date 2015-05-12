//
//  PLFitViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/11.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "PLFittingViewController.h"

#import <PureLayout/PureLayout.h>

@interface PLFittingViewController ()

@end

@implementation PLFittingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.titleLabel autoSetDimensionsToSize:CGSizeMake(200, 20)];
    [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 0, 30) excludingEdge:ALEdgeBottom];
    
    [self.blueView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:0];
    [self.blueView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel withOffset:0];
    [self.blueView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [self.blueView autoSetDimension:ALDimensionHeight toSize:44.];
    
    [self.imageView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.titleLabel withOffset:0];
    [self.imageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.blueView withOffset:20];
    [self.imageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    [self.imageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    
//    [self.containerView autoSetDimension:ALDimensionWidth toSize:200];
//    [self.view setNeedsUpdateConstraints];
//    CGSize compressedSize = UILayoutFittingCompressedSize;
    CGSize size = [self.containerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    self.containerView.frame = CGRectMake(80, 80, 200, size.height);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

@end
