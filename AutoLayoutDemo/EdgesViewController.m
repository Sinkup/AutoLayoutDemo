//
//  EdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/8.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "EdgesViewController.h"

@interface EdgesViewController ()

@end

@implementation EdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(update:)];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Update" style:UIBarButtonItemStylePlain target:self action:@selector(update:)];
    self.navigationItem.rightBarButtonItem = addButton;
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
- (UIView *)topView
{
    if (!_topView) {
        _topView = [[UIView alloc] init];//WithFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16))
        _topView.backgroundColor = [UIColor darkGrayColor];
        
        [self.view addSubview:_topView];
    }
    
    return _topView;
}

- (UIView *)middleView
{
    if (!_middleView) {
        _middleView = [[UIView alloc] init];//WithFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16))
        _middleView.backgroundColor = [UIColor blueColor];
        
        [self.view addSubview:_middleView];
    }
    
    return _middleView;
}

- (UIView *)containerView
{
    if (!_containerView) {
        _containerView = [[UIView alloc] init];//WithFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16))
        _containerView.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:_containerView];
    }
    
    return _containerView;
}

- (void)update:(id)sender
{
//    if (self.shrinked) {
//        self.containterView.frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16));
//        self.shrinked = NO;
//    } else {
//        self.containterView.frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(100, 64, 8, 128));
//        self.shrinked = YES;
//    }
}

@end
