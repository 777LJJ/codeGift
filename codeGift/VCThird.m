//
//  VCThird.m
//  codeGift
//
//  Created by J J on 2018/12/28.
//  Copyright © 2018 J J. All rights reserved.
//

#import "VCThird.h"
#import "VCFourth.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface VCThird ()


@end

int i = 0;

@implementation VCThird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _array = @[@"棉花糖",@"菜",@"书法",@"电影票",@"靓",@"短发",@"展",@"Anthony",@"重艺",@""];
    self.view.backgroundColor = [UIColor whiteColor];
    _backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _backView.image = [UIImage imageNamed:@"timg-2"];
    [self.view addSubview:_backView];
    [self creatBtn];
    _time = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(jerk) userInfo:nil repeats:YES];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 60, WIDTH - 40, HEIGHT * 2.7 / 4.0)];
    view.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0 blue:246.0/255.0 alpha:1.0];
    view.layer.cornerRadius = 10;
    //view.layer.masksToBounds = YES;
    [self addShadowToView:view withColor:[UIColor blackColor]];
    [self.view addSubview:view];
    
    [self firstView];
}


/// 添加四边阴影效果
- (void)addShadowToView:(UIView *)theView withColor:(UIColor *)theColor {
    // 阴影颜色
    theView.layer.shadowColor = theColor.CGColor;
    // 阴影偏移，默认(0, -3)
    theView.layer.shadowOffset = CGSizeMake(0,0);
    // 阴影透明度，默认0
    theView.layer.shadowOpacity = 0.77;
    // 阴影半径，默认3
    theView.layer.shadowRadius = 7;
}

- (void)jerk
{
    //[_time invalidate];
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    keyFrameAnimation.values = @[@(-(10) / 180.0 * M_PI),@((10) / 180.0 * M_PI),@(-(10) / 180.0 * M_PI)];
    keyFrameAnimation.duration = 0.3;
    keyFrameAnimation.repeatCount = MAXFLOAT;
    [_button.layer addAnimation:keyFrameAnimation forKey:NSStringFromSelector(_cmd)];
}

- (void)changeColor
{
    CGFloat a = arc4random_uniform(2);
    CGFloat b = arc4random_uniform(2);
    CGFloat c = arc4random_uniform(2);
    CGFloat d = arc4random_uniform(2);
    _label.textColor = [UIColor colorWithRed:a green:b blue:c alpha:d];
}


- (void)creatBtn
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setImage:[UIImage imageNamed:@"timg.png"] forState:UIControlStateNormal];
    _button.frame = CGRectMake(WIDTH / 2 - 40, HEIGHT - 133, 80, 40);
    [self.view addSubview:_button];
    
    [_button addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)firstView
{
    _label = [[UILabel alloc] init];
    _label.font = [UIFont fontWithName:@"Chalkduster" size:16];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.frame = CGRectMake(50, 110 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_array[i]]];
    _imageView.frame = CGRectMake(WIDTH / 2 - 1, HEIGHT / 3, 2, 2);
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.layer.cornerRadius = 7;
    _imageView.layer.masksToBounds = YES;
    

    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    if (i == 0)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 852.0 / 640.0);
        _label.text = @"2017/01/30 一個暖心的棉花糖";
        _label.frame = CGRectMake(50, 110 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 1)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 960 / 720.0);
        _label.text = @"2017/06/21 做得一手好菜";
        _label.frame = CGRectMake(50, 110 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 2)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 1853 / 1245);
        _label.text = @"2017/08/09 毛筆的小楷書一行一行";
        _label.frame = CGRectMake(50, 120 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 3)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 960 / 822);
        _label.text = @"2017/12/22 我們首次的《尋夢幻遊記》";
        _label.frame = CGRectMake(50, 100 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 4)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 949 / 640);
        _label.text = @"2018/09/04 最美證件照";
        _label.frame = CGRectMake(50, 120 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 5)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 960 / 720);
        _label.text = @"2018/09/04 發量厚重卻機具輕盈感";
        _label.frame = CGRectMake(50, 110 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 6)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 949 / 640);
        _label.text = @"2018/12/25 聖誕節當天的文創總監";
        _label.frame = CGRectMake(50, 110 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 7)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 949 / 640);
        _label.text = @"2018/12/30 遇见小王子";
        _label.frame = CGRectMake(50, 120 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    else if (i == 8)
    {
        _imageView.frame = CGRectMake(40, 80, WIDTH - 80, (WIDTH - 80) * 949 / 640);
        _label.text = @"2019/01/06 重藝是個好地方";
        _label.frame = CGRectMake(50, 120 + (WIDTH - 100) * 1853 / 1245, WIDTH - 100, 50);
    }
    [UIView commitAnimations];
    [self.view addSubview:_imageView];
    i ++;
    [self.view addSubview:_label];
    
}

- (void)pressBtn
{
    if (i != 0)
    {
        [_imageView removeFromSuperview];
        [_label removeFromSuperview];
    }
    [self firstView];
    if (i == 9)
    {
        [_button addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)next
{
    NSLog(@"qghrgwef");
    VCFourth *forth = [[VCFourth alloc] init];
    CATransition *animation = [CATransition animation];
    animation.duration = 0.777;
    animation.type = @"push";
    animation.subtype = kCAGravityTop;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    [self presentViewController:forth animated:NO completion:nil];
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
