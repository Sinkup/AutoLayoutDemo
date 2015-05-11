//
//  PLFitViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/11.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "PLFitViewController.h"

#import <PureLayout/PureLayout.h>

@interface PLFitViewController ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation PLFitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.containerView = [[UIView alloc] init];
    self.containerView.clipsToBounds = YES;
    self.containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"哈哈哈";
    self.titleLabel.font = [UIFont systemFontOfSize:13.];
    [self.containerView addSubview:self.titleLabel];
    
    self.blueView = [[UIView alloc] init];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.containerView addSubview:self.blueView];
    
    self.imageView = [UIImageView new];
    self.imageView.backgroundColor = [UIColor orangeColor];
    [self.containerView addSubview:self.imageView];
    
//    [self.titleLabel autoSetDimensionsToSize:CGSizeMake(200, 20)];
    [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 0, 30) excludingEdge:ALEdgeBottom];
    
    [self.blueView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:10];
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
