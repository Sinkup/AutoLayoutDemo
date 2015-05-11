//
//  MASEdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/8.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "MASEdgesViewController.h"
#import <Masonry/Masonry.h>

@interface MASEdgesViewController ()

@end

@implementation MASEdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIEdgeInsets edge = UIEdgeInsetsMake(8, 8, 8, 8);
    UIImageView *view = [[UIImageView alloc] init];//WithFrame:UIEdgeInsetsInsetRect(self.containerView.bounds, edge)
    view.backgroundColor = [UIColor orangeColor];
//    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.containerView addSubview:view];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(72, 16, 8, 16));
//        make.top.equalTo(self.view.mas_top).offset(72);
//        make.left.equalTo(self.view.mas_left).offset(16);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-8);
//        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView).insets(edge);
//        make.top.equalTo(self.containterView.mas_top).offset(edge.top);
//        make.leading.equalTo(self.containterView.mas_leading).offset(edge.left);
//        make.bottom.equalTo(self.containterView.mas_bottom).offset(-edge.bottom);
//        make.trailing.equalTo(self.containterView.mas_trailing).offset(-edge.right);
    }];
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
        [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(72, 16, 8, 16));
        }];
    } else {
        [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(200, 64, 200, 128));
        }];
    }
    
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
