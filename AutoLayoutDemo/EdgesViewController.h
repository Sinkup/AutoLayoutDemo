//
//  EdgesViewController.h
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/8.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EdgesViewController : UIViewController

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic) BOOL shrinked;

- (void)update:(id)sender;

@end
