//
//  DetailViewController.h
//  AnimationDemo
//
//  Created by 周泉 on 12-9-12.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
@private
    UIView *parentView;
    UIView *view1;
    UIView *view2;
    NSInteger _row;
    NSInteger _section;
    UILabel *label;
    UIButton *button;
    NSString *_detailTitle;
}

@property (nonatomic) NSInteger row;
@property (nonatomic) NSInteger section;     
@property (nonatomic, copy) NSString *title;

@end
