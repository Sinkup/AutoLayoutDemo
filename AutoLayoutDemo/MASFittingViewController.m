//
//  MASFittingViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/12.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "MASFittingViewController.h"
#import <Masonry/Masonry.h>

@interface MASFittingViewController ()

@end

@implementation MASFittingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView.mas_left).offset(20);
        make.top.equalTo(self.containerView.mas_top).offset(10);
        make.right.equalTo(@-30);
//        make.size.equalTo(CGSizeMake(200, 20));
        
    }];
    
    [self.blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left).offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
        make.right.equalTo(self.containerView.mas_right).offset(-10);
        make.height.equalTo(@44);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.blueView.mas_left).offset(0);
        make.top.equalTo(self.blueView.mas_bottom).offset(20);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(-20);
        make.size.equalTo([NSValue valueWithCGSize:CGSizeMake(100, 100)]);
    }];
    
    CGSize size = [self.containerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    self.containerView.frame = CGRectMake(80, 80, 200, size.height);
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
