//
//  FittingViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/12.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "FittingViewController.h"

@interface FittingViewController ()

@end

@implementation FittingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
