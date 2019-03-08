//
//  VCFourth.m
//  codeGift
//
//  Created by J J on 2018/12/28.
//  Copyright © 2018 J J. All rights reserved.
//
#import <CoreText/CoreText.h>
#import "VCFourth.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface VCFourth ()

@end

@implementation VCFourth

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view;
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *name = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"蜜獾"]];
    name.layer.cornerRadius = 50;
    name.layer.masksToBounds = YES;
    name.frame = CGRectMake(WIDTH / 2.0 - 50, 177, 100, 100);
    [self.view addSubview:name];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"777"]];
    imageView.frame = CGRectMake(0, 377, WIDTH, 120);
    [self.view addSubview:imageView];
    
    UIImageView *imageView01 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"祝福"]];
    imageView01.frame = CGRectMake(33.5, 500, 347, 200);
    [self.view addSubview:imageView01];
    
//    UIImageView *imageView02 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"生活"]];
//    imageView02.frame = CGRectMake(0, 540, WIDTH, 60);
//    [self.view addSubview:imageView02];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT * 1.7 / 3, WIDTH, 50)];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:20];
//    label.text = @"最后 愿自己快乐且自由的生活";
//    label.textColor = [UIColor blackColor];
//    [self.view addSubview:label];
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
