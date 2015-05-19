//
//  PALArrayViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/19.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "PALArrayViewController.h"
#import <PureLayout/PureLayout.h>

@interface PALArrayViewController ()

@end

@implementation PALArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *array = @[ self.redView, self.blueView, self.orangeView, self.purpleView ];
    [array autoSetViewsDimension:ALDimensionHeight toSize:60];
//    [array autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:10];
//    [array autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:10 insetSpacing:NO];
//    [array autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:10 insetSpacing:NO matchedSizes:YES];
    [array autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSize:80 insetSpacing:YES];
    [self.redView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
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

- (UIView *)redView
{
    if (!_redView) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:_redView];
    }
    
    return _redView;
}

- (UIView *)blueView
{
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
        
        [self.view addSubview:_blueView];
    }
    
    return _blueView;
}

- (UIView *)orangeView
{
    if (!_orangeView) {
        _orangeView = [UIView new];
        _orangeView.backgroundColor = [UIColor orangeColor];
        
        [self.view addSubview:_orangeView];
    }
    
    return _orangeView;
}

- (UIView *)purpleView
{
    if (!_purpleView) {
        _purpleView = [UIView new];
        _purpleView.backgroundColor = [UIColor purpleColor];
        
        [self.view addSubview:_purpleView];
    }
    
    return _purpleView;
}

@end
