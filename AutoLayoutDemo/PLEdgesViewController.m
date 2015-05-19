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
//    self.normalConstraints = [self.containerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(324, 16, 8, 16)];
    self.normalConstraints = [UIView autoCreateConstraintsWithoutInstalling:^{
        [self.containerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(324, 16, 8, 16) excludingEdge:ALEdgeTop];
        [self.containerView autoPinToTopLayoutGuideOfViewController:self withInset:260];
    }];
    
    self.shrinkedConstraints = [UIView autoCreateConstraintsWithoutInstalling:^{
        [self.containerView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(324, 100, 24, 100) excludingEdge:ALEdgeTop];
        [self.containerView autoPinToTopLayoutGuideOfViewController:self withInset:300];
    }];
    
    [self.normalConstraints autoInstallConstraints];
    
    // self.containerView的子视图
    UIImageView *view = [[UIImageView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    [self.containerView addSubview:view];
    
    UIEdgeInsets edge = UIEdgeInsetsMake(8, 8, 8, 8);
    [view autoPinEdgesToSuperviewEdgesWithInsets:edge];
    
    [self.topView autoPinToTopLayoutGuideOfViewController:self withInset:8];
    [self.topView autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.topView autoSetDimensionsToSize:CGSizeMake(240, 100)];
    
    [self.middleView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.topView withOffset:8];
    [self.middleView autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.middleView autoPinEdgeToSuperviewMargin:ALEdgeRight];
//    [self.middleView autoSetDimension:ALDimensionHeight toSize:120];
    [self.middleView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionWidth ofView:self.middleView withMultiplier:0.2];// 宽高比
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
    
//    self.shrinked = !self.shrinked;
    
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.8
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         self.shrinked = !finished ?: !self.shrinked;
                     }];
}

@end
