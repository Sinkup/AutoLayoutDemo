//
//  PALEdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/7.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "PALEdgesViewController.h"

@interface PALEdgesViewController ()

@end

@implementation PALEdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.containterView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    // 需将该属性置为NO，否则会发生冲突
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1. constant:72];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1. constant:-8];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1. constant:16];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:self.containerView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1. constant:-16];
    
    [self.view addSubview:self.containerView];
    [self.view addConstraints:@[ top, bottom, left, right ]];
    
    UIEdgeInsets edge = UIEdgeInsetsMake(8, 8, 8, 8);
    // 使用Auto Layout，无需设置frame
    UIImageView *view = [[UIImageView alloc] init];//WithFrame:UIEdgeInsetsInsetRect(self.containerView.bounds, edge)
    view.backgroundColor = [UIColor orangeColor];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeTop multiplier:1. constant:edge.top];
    bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeBottom multiplier:1. constant:-edge.bottom];
    left = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeLeading multiplier:1. constant:edge.left];
    right = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeTrailing multiplier:1. constant:-edge.right];

    [self.containerView addSubview:view];
    [self.containerView addConstraints:@[ top, bottom, left, right ]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
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
        for (NSLayoutConstraint *constraint in self.view.constraints) {
            if (constraint.firstItem != self.containerView) {
                continue;
            }
            
            switch (constraint.firstAttribute) {
                case NSLayoutAttributeTop:
                    constraint.constant = 72;
                    break;
                case NSLayoutAttributeBottom:
                    constraint.constant = -8;
                    break;
                case NSLayoutAttributeLeading:
                    constraint.constant = 16;
                    break;
                case NSLayoutAttributeTrailing:
                    constraint.constant = -16;
                    break;
                    
                default:
                    break;
            }
        }
    } else {
        for (NSLayoutConstraint *constraint in self.view.constraints) {
            if (constraint.firstItem != self.containerView) {
                continue;
            }
            
            switch (constraint.firstAttribute) {
                case NSLayoutAttributeTop:
                    constraint.constant = 200;
                    break;
                case NSLayoutAttributeBottom:
                    constraint.constant = -200;
                    break;
                case NSLayoutAttributeLeading:
                    constraint.constant = 100;
                    break;
                case NSLayoutAttributeTrailing:
                    constraint.constant = -100;
                    break;
                    
                default:
                    break;
            }
        }
    }
    
//    [UIView animateWithDuration:0.5 animations:^{
//        [self.view layoutIfNeeded];
//    } completion:^(BOOL finished) {
//        self.shrinked = !self.shrinked;
//    }];
    
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


- (void)updateViewConstraints
{
    [super updateViewConstraints];
}

@end
