//
//  ViewController.m
//  UIScrollViewCarousel
//
//  Created by apple on 16/6/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "LZBInifiteScrollView.h"

@interface ViewController () <LZBInifiteScrollViewDelegate>

@property (nonatomic, strong) LZBInifiteScrollView *carousel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.carousel];
    self.carousel.placeholder = [UIImage imageNamed:@"LZBInifiteScrollView.bundle/placeHoder"];
    //设置滚动的图片数组，支持(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】)
    self.carousel.images = @[[UIImage imageNamed:@"LZBInifiteScrollView.bundle/1"],@"LZBInifiteScrollView.bundle/2",@"LZBInifiteScrollView.bundle/3",[NSURL URLWithString:@"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1916500820,874871263&fm=116&gp=0.jpg"]];
    self.carousel.foucsDelegate = self;
    
}

- (LZBInifiteScrollView *)carousel
{
    if(_carousel == nil)
    {
        _carousel = [[LZBInifiteScrollView alloc]init];
        _carousel.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200);
        
    }
    return _carousel;
}

- (void)lzbInifiteScrollView:(LZBInifiteScrollView *)foucsScrollView didSelectScrollViewIndex:(NSInteger)index
{
    NSLog(@"----%@,点击了第几张图片%ld",foucsScrollView,index);
}



@end
