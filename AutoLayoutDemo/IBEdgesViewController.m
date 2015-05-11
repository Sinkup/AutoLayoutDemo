//
//  IBALEdgesViewController.m
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/7.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import "IBEdgesViewController.h"

@interface IBEdgesViewController ()

@property (nonatomic) BOOL shrinked;

@end

@implementation IBEdgesViewController

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
        for (NSLayoutConstraint *constraint in self.view.constraints) {
            if (constraint.firstItem != self.containerView) {
                continue;
            }
            
            switch (constraint.firstAttribute) {
                case NSLayoutAttributeTop:
                    constraint.constant = 8;
                    break;
                case NSLayoutAttributeBottom:
                    constraint.constant = -8;
                    break;
                case NSLayoutAttributeLeading:
                    constraint.constant = 0;
                    break;
                case NSLayoutAttributeTrailing:
                    constraint.constant = 0;
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
        [self.view layoutIfNeeded];
//    } completion:^(BOOL finished) {
        self.shrinked = !self.shrinked;
//    }];
}

@end
