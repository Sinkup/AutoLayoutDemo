//
//  PALEdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/7.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "PALEdgesViewController.h"

@interface PALEdgesViewController ()

@property (nonatomic, strong) UIView *containterView;
@property (nonatomic) BOOL shrinked;

@end

@implementation PALEdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.containterView = [[UIView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16))];
    self.containterView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containterView];
    
    UIEdgeInsets edge = UIEdgeInsetsMake(8, 8, 8, 8);
    UIImageView *view = [[UIImageView alloc] initWithFrame:UIEdgeInsetsInsetRect(self.containterView.bounds, edge)];
    view.backgroundColor = [UIColor orangeColor];
//    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.containterView attribute:NSLayoutAttributeTop multiplier:1. constant:edge.top];
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.containterView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeBottom multiplier:1. constant:edge.bottom];
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.containterView attribute:NSLayoutAttributeLeading multiplier:1. constant:edge.left];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.containterView attribute:NSLayoutAttributeTrailing multiplier:1. constant:edge.right];

    [self.containterView addSubview:view];
    [self.containterView addConstraints:@[ top, bottom, left, right ]];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(update:)];
    self.navigationItem.rightBarButtonItem = addButton;
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
        self.containterView.frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16));
        self.shrinked = NO;
    } else {
        self.containterView.frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(100, 64, 8, 128));
        self.shrinked = YES;
    }
    
    [self.containterView setNeedsLayout];
}

//- (void)updateViewConstraints
//{
//    [super updateViewConstraints];
//}

@end
