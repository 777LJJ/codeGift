//
//  ViewController.m
//  codeGift
//
//  Created by J J on 2018/12/25.
//  Copyright © 2018 J J. All rights reserved.
//

#import "ViewController.h"
#import <ImageIO/ImageIO.h>
#import "VCSecond.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@property (strong,nonatomic) UIImageView *backView;
@property (strong,nonatomic) UIImageView *backView0;
@property (strong,nonatomic) UILabel *lab;
@property (strong,nonatomic) UILabel *lab01;
@property (strong,nonatomic) UILabel *lab0;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _backView0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unfeeling"]];
    _backView0.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:_backView0];
    
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sangeqi"]];
    _backView.frame = CGRectMake(150, HEIGHT / 6.0, WIDTH - 300, WIDTH - 300);
    _backView.layer.cornerRadius = 50;
    _backView.layer.masksToBounds = YES;
    [_backView0 addSubview:_backView];
    
    _lab = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 2 - 77, WIDTH, 100)];
    _lab.textColor = [UIColor whiteColor];
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab.text = @"12";
    _lab.textAlignment = NSTextAlignmentCenter;
    [_backView0 addSubview:_lab];
    
    _lab01 = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 2, WIDTH, 100)];
    _lab01.textColor = [UIColor whiteColor];
    _lab01.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab01.text = @"/";
    _lab01.textAlignment = NSTextAlignmentCenter;
    [_backView0 addSubview:_lab01];
    
    _lab0 = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 2 + 77, WIDTH, 100)];
    _lab0.textColor = [UIColor whiteColor];
    _lab0.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab0.text = @"15";
    _lab0.textAlignment = NSTextAlignmentCenter;
    [_backView0 addSubview:_lab0];
    
    
    _time = [NSTimer scheduledTimerWithTimeInterval:3.33 target:self selector:@selector(Begin) userInfo:nil repeats:YES];
}

- (void)Begin
{
    [_time invalidate];
    [_lab removeFromSuperview];
    _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backColor"]];
    
    _backView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:_backView];

    [self creatBtn];
    [self creatGIF];
    [self BeginAnimation];
}

- (void)BeginAnimation
{
    _time = [NSTimer scheduledTimerWithTimeInterval:3.16 target:self selector:@selector(makeFireWorksDisplay) userInfo:nil repeats:YES];
}

- (void)makeFireWorksDisplay
{
    [_time invalidate];
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    fireworksEmitter.emitterPosition = CGPointMake(WIDTH / 2.0, HEIGHT / 2.0);
    fireworksEmitter.emitterSize = CGSizeMake(WIDTH / 2.0, 0.0);
    fireworksEmitter.emitterMode = kCAEmitterLayerOutline;
    fireworksEmitter.renderMode = kCAEmitterLayerAdditive;
    fireworksEmitter.emitterShape = kCAEmitterLayerLine;
    fireworksEmitter.seed = (arc4random() % 100) + 1;
    
    
    /**
     *  添加发射点
     一个圆（发射点）从底下发射到上面的一个过程
     */
    CAEmitterCell* rocket  = [CAEmitterCell emitterCell];
    rocket.birthRate = 1.0; //是每秒某个点产生的effectCell数量
    //rocket.emissionRange = 0.25 * M_PI; // 周围发射角度
    rocket.velocity = 400; // 速度
    rocket.velocityRange = 100; // 速度范围
    rocket.yAcceleration = 75; // 粒子y方向的加速度分量
    rocket.lifetime = 2.02; // effectCell的生命周期，既在屏幕上的显示时间要多长。
    
    // 下面是对 rocket 中的内容，颜色，大小的设置
    //rocket.contents = (id) [[UIImage imageNamed:@"circle.png"] CGImage];
    rocket.scale = 0.2;
    rocket.color = [[UIColor redColor] CGColor];
    rocket.greenRange = 1.0;
    rocket.redRange = 1.0;
    rocket.blueRange = 1.0;
    //rocket.spinRange = M_PI; // 子旋转角度范围
    
    /**
     * 添加爆炸的效果，突然之间变大一下的感觉
     */
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    burst.birthRate = 1.0;
    burst.velocity = 0;
    burst.scale = 2.5;
    burst.redSpeed = -1.5;
    burst.blueSpeed = +1.5;
    burst.greenSpeed = +1.0;
    burst.lifetime = 0.35;
    
    /**
     *  添加星星扩散的粒子
     */
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    spark.birthRate = 400;
    spark.velocity = 125;
    spark.emissionRange = 2* M_PI;
    spark.yAcceleration = 75; //粒子y方向的加速度分量
    spark.lifetime = 3;
    
    spark.contents = (id) [[UIImage imageNamed:@"630.png"] CGImage];
    spark.scaleSpeed = -0.2;
    spark.greenSpeed = -0.1;
    spark.redSpeed = 0.4;
    spark.blueSpeed = -0.1;
    spark.alphaSpeed = -0.25; // 例子透明度的改变速度
    spark.spin = 2 * M_PI; // 子旋转角度
    spark.spinRange = 2 * M_PI;
    
    // 将 CAEmitterLayer 和 CAEmitterCell 结合起来
    fireworksEmitter.emitterCells = [NSArray arrayWithObject:rocket];
    //在圈圈粒子的基础上添加爆炸粒子
    rocket.emitterCells = [NSArray arrayWithObject:burst];
    //在爆炸粒子的基础上添加星星粒子
    burst.emitterCells = [NSArray arrayWithObject:spark];
    // 添加到图层上
    [self.view.layer addSublayer:fireworksEmitter];
    
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    keyFrameAnimation.values = @[@(-(10) / 180.0 * M_PI),@((10) / 180.0 * M_PI),@(-(10) / 180.0 * M_PI)];
    keyFrameAnimation.duration = 0.3;
    keyFrameAnimation.repeatCount = MAXFLOAT;
    [_button.layer addAnimation:keyFrameAnimation forKey:NSStringFromSelector(_cmd)];

    [_gifImageView removeFromSuperview];
    
    _lab01 = [[UILabel alloc] initWithFrame:CGRectMake(0, HEIGHT / 2 - 77, WIDTH, 100)];
    _lab01.textColor = [UIColor whiteColor];
    _lab01.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab01.text = @"19th";
    _lab01.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_lab01];
    
    _lab = [[UILabel alloc] init];
    _lab.textAlignment = NSTextAlignmentCenter;
    _lab.font = [UIFont fontWithName:@"Chalkduster" size:35];
    _lab.text = @"Happy birthday";
    _lab.textColor = [UIColor yellowColor];
    [self.view addSubview:_lab];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDidStopSelector:@selector(stopAnim)];
    _lab.frame = CGRectMake(0, HEIGHT / 2 - 175, WIDTH, 100);
    [UIView commitAnimations];
}

- (void)stopAnim
{
    _lab0 = [[UILabel alloc] init];
    _lab0.textAlignment = NSTextAlignmentCenter;
    _lab0.font = [UIFont fontWithName:@"Chalkduster" size:50];
    _lab0.text = @"JJ.Liu";
    _lab0.textColor = [UIColor yellowColor];
    [self.view addSubview:_lab0];

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDidStopSelector:@selector(end)];
    _lab0.frame = CGRectMake(0, HEIGHT / 2, WIDTH, 100);
    [UIView commitAnimations];

}

- (void)end
{
    CASpringAnimation *springAni = [CASpringAnimation animationWithKeyPath:@"position.x"];
    
    //阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    springAni.damping = 50;
    
    //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    springAni.mass = 500;
    
    //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    springAni.stiffness = 20000;
    
    //初始速率，动画视图的初始速度大小。
    //速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    springAni.initialVelocity = 20;
    springAni.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
    
    //估算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算;
    springAni.duration = springAni.settlingDuration;
    
    //默认为YES 。当设置为YES时，动画结束后，移除layer层的；当设置为NO时，保持动画结束时layer的状态
    springAni.removedOnCompletion = NO;
    
    //addAnimation:(CAAnimation *)anim forKey:(nullable NSString *)key将动画添加到视图的layer层，“key”作为这个动画的唯一标示符，可以是任意唯一的字符串或为空；
    [_lab01.layer addAnimation:springAni forKey:@"springAnimation"];
    
    _time = [NSTimer scheduledTimerWithTimeInterval:0.19 target:self selector:@selector(changeColor) userInfo:nil repeats:YES];
}

- (void)changeColor
{
    self.view.backgroundColor = [UIColor blackColor];
    [_backView removeFromSuperview];
    [_backView0 removeFromSuperview];
    [self.view addSubview:_button];
    _lab0.textColor = [UIColor grayColor];
    _lab.textColor = [UIColor grayColor];
}

- (void)creatGIF
{
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"timg-1" withExtension:@"gif"];
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef) fileUrl, NULL);
    size_t frameCout = CGImageSourceGetCount(gifSource);
    
    NSMutableArray *frames = [[NSMutableArray alloc] init];
    for (size_t i = 0; i < frameCout; i++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL);
        UIImage *imageName = [UIImage imageWithCGImage:imageRef];
        [frames addObject:imageName];
        CGImageRelease(imageRef);
    }
    _gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, HEIGHT / 2 - 160, WIDTH - 120, WIDTH - 120)];
    _gifImageView.animationImages = frames;
    _gifImageView.animationDuration = 3.16;
    [_gifImageView startAnimating];
    [_backView addSubview:_gifImageView];
}

- (void)creatBtn
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setImage:[UIImage imageNamed:@"timg.png"] forState:UIControlStateNormal];
    _button.frame = CGRectMake(WIDTH / 2 - 40, HEIGHT - 133, 80, 40);
    [self.view addSubview:_button];
    
    [_button addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pressBtn
{
    VCSecond *second = [[VCSecond alloc] init];
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.777;
    animation.type = @"cube";
    animation.subtype = kCAGravityTop;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
    
    [self presentViewController:second animated:NO completion:nil];
}


@end
