//
//  VCSecond.m
//  codeGift
//
//  Created by J J on 2018/12/25.
//  Copyright © 2018 J J. All rights reserved.
//

#import "VCSecond.h"
#import "VCThird.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface VCSecond ()
@property (strong,nonatomic) UILabel *lab;
@property (strong,nonatomic) UIImageView *backView;
@property (strong,nonatomic) NSTimer *time;
@property (strong,nonatomic) UIButton *button;
@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unfeeling01"]];
    _backView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:_backView];
    
    _lab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 4.0, WIDTH, 100)];
    _lab.textColor = [UIColor whiteColor];
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab.text = @"N";
    _lab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_lab];
    
    _lab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 4.0 + 100, WIDTH, 100)];
    _lab.textColor = [UIColor whiteColor];
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab.text = @"E";
    _lab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_lab];
    
    _lab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 4.0 + 200, WIDTH, 100)];
    _lab.textColor = [UIColor whiteColor];
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab.text = @"X";
    _lab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_lab];
    
    _lab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 4.0 + 300, WIDTH, 100)];
    _lab.textColor = [UIColor whiteColor];
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab.text = @"T";
    _lab.textAlignment = NSTextAlignmentCenter;
    [_backView addSubview:_lab];
    
    _time = [NSTimer scheduledTimerWithTimeInterval:3.33 target:self selector:@selector(Begin) userInfo:nil repeats:YES];
}

- (void)Begin
{
    [_time invalidate];
    [_lab removeFromSuperview];
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timg7"]];
    
    _backView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:_backView];
    [self creatBtn];
    [self creatLab];
    [self Darling];
    [self Boy];
}

- (void)creatLab
{
    _lab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 4, WIDTH, 50)];
    _lab.textAlignment = NSTextAlignmentCenter;
    _lab.text = @"1th anniversary";
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:33];
    
    _lab.textColor = [UIColor colorWithRed:0.5 green:0.7 blue:0.77 alpha:0.8];
    _time = [NSTimer scheduledTimerWithTimeInterval:0.19 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
    [self.view addSubview:_lab];
}

- (void)Darling
{
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"darling"]];
    _backView.frame = CGRectMake(- WIDTH / 4, HEIGHT / 3 + 20, WIDTH / 4, WIDTH / 4 * 360 / 192);
    [self.view addSubview:_backView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    _backView.frame = CGRectMake(WIDTH / 4 - 10, HEIGHT / 3 + 20, WIDTH / 4, WIDTH / 4 * 360 / 192);
    [UIView commitAnimations];
}

- (void)Boy
{
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"boy"]];
    _backView.frame = CGRectMake(WIDTH * 5.0 / 4, HEIGHT / 3 + 16, WIDTH / 8 * 2.5, WIDTH / 8.0 * 3 * 360 / 281);
    [self.view addSubview:_backView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    _backView.frame = CGRectMake(WIDTH * 2.0 / 4 - 10, HEIGHT / 3 - 4 + 20, WIDTH / 8 * 2.5, WIDTH / 8.0 * 3 * 360 / 281);
    [UIView commitAnimations];
}

- (void)changeColor
{
    CGFloat a = arc4random_uniform(2);
    CGFloat b = arc4random_uniform(2);
    CGFloat c = arc4random_uniform(2);
    CGFloat d = arc4random_uniform(2);
    _lab.textColor = [UIColor colorWithRed:a green:b blue:c alpha:d];
}

- (void)creatBtn
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setImage:[UIImage imageNamed:@"timg.png"] forState:UIControlStateNormal];
    _button.frame = CGRectMake(WIDTH / 2 - 40, HEIGHT - 133, 80, 40);
    [self.view addSubview:_button];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    keyFrameAnimation.values = @[@(-(10) / 180.0 * M_PI),@((10) / 180.0 * M_PI),@(-(10) / 180.0 * M_PI)];
    keyFrameAnimation.duration = 0.3;
    keyFrameAnimation.repeatCount = MAXFLOAT;
    [_button.layer addAnimation:keyFrameAnimation forKey:NSStringFromSelector(_cmd)];
    
    [_button addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressBtn
{
    VCThird *third = [[VCThird alloc] init];
    CATransition *animation = [CATransition animation];
    animation.duration = 0.777;
    animation.type = @"fade";
    animation.subtype = kCAGravityTop;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    [self presentViewController:third animated:NO completion:nil];
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
