//
//  DetailViewController.h
//  AutoLayoutDemo
//
//  Created by ChenHao on 15/5/7.
//  Copyright (c) 2015年 ChenHao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

