//
//  ViewController.m
//  XHH_POPDemo
//
//  Created by xiaohuihui on 2016/12/21.
//  Copyright © 2016年 30-陈辉华. All rights reserved.
//

#import "ViewController.h"
#import <POP.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/** 当前图片下标 */
@property (assign, nonatomic) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 裁剪为圆形 */
    self.imageView.layer.cornerRadius = 120;
    self.imageView.layer.masksToBounds = YES;
    [self addRotateAnimation];
}

/** 添加旋转动画 */
- (void)addRotateAnimation {
    POPBasicAnimation *rotationAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotationAnimation.beginTime = CACurrentMediaTime();
    rotationAnimation.toValue = @(1000);
    rotationAnimation.duration = 1000;
    [self.imageView.layer pop_addAnimation:rotationAnimation forKey:nil];
}

/** 添加缩放动画 */
- (void)addAnimaition {
    /** 缩放动画 */
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.7, 0.7)];
    scaleAnimation.duration = 0.3;
//    scaleAnimation.springBounciness = 0.5;
//    scaleAnimation.springSpeed = 5;
    
    [self.imageView.layer pop_addAnimation:scaleAnimation forKey:nil];
    scaleAnimation.completionBlock = ^(POPAnimation *animation, BOOL finished) {
        POPBasicAnimation *scaleAnimationTwo = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        scaleAnimationTwo.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimationTwo.duration = 0.3;
        [self.imageView.layer pop_addAnimation:scaleAnimationTwo forKey:nil];
    };
}

- (IBAction)preButton:(id)sender {
}

- (IBAction)nextButton:(id)sender {
    [self addAnimaition];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
