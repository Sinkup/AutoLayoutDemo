//
//  IBALEdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/7.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "IBALEdgesViewController.h"

@interface IBALEdgesViewController ()

@property (nonatomic) BOOL shrinked;

@end

@implementation IBALEdgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(update:)];
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

- (void)update:(id)sender
{
    if (self.shrinked) {
        self.containerView.frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(72, 16, 8, 16));
        self.shrinked = NO;
    } else {
        self.containerView.frame = UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(100, 64, 8, 128));
        self.shrinked = YES;
    }
    
    [self.containerView updateConstraintsIfNeeded];
}

@end
