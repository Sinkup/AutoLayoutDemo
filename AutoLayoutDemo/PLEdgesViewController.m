//
//  PLEdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/8.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "PLEdgesViewController.h"
#import <PureLayout/PureLayout.h>

@interface PLEdgesViewController ()

@property (nonatomic, strong) NSArray *normalConstraints;
@property (nonatomic, strong) NSArray *shrinkedConstraints;

@end

@implementation PLEdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置self.containerView的约束
    self.normalConstraints = [self.containerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(72, 16, 8, 16)];
    self.shrinkedConstraints = [UIView autoCreateConstraintsWithoutInstalling:^{
        [self.containerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(200, 100, 200, 100)];
    }];
    
    // self.containerView的子视图
    UIImageView *view = [[UIImageView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    [self.containerView addSubview:view];
    
    UIEdgeInsets edge = UIEdgeInsetsMake(8, 8, 8, 8);
    [view autoPinEdgesToSuperviewEdgesWithInsets:edge];
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

- (void)update:(id)sender
{
    if (self.shrinked) {
        [self.shrinkedConstraints autoRemoveConstraints];
        [self.normalConstraints autoInstallConstraints];
    } else {
        [self.normalConstraints autoRemoveConstraints];
        [self.shrinkedConstraints autoInstallConstraints];
    }
    
    self.shrinked = !self.shrinked;
}

@end
