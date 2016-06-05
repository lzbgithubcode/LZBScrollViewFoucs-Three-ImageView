# LZBScrollViewFoucs-Three-ImageView
三个imageView实现轮播图

#使用方法
1.导入我的头文件#import "LZBInifiteScrollView.h"

2.最好采用懒加载控件LZBInifiteScrollView（在这里是个人习惯，但是这里有个注意点：我们都知道控件的属性保存@property一般是用weak修饰，因为在addSubview的时候就已经有strong强引用这个控件了，但是懒加载的时候一定要用strong,原因：创建控件后（alloc或者new）,都会使引用计数器加1，默认是强指针指向他，假如用weak修饰，返回的是_（下划线）+属性是弱引用，会自动销毁，可能返回nil,懒加载控件不成功）

3.设置轮播图的滚动图片数组支持(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】注意：设置SDWebImage加载图片的时候注意设置info.plist里面，支持网络https请求App Transport Security Settings)



#下面是功能参数介绍
placeholder ： 可选设置，可以设置占位图片，默认是我LZBInifiteScrollView.bundle/placeHoder  
images: 必选设置，图片数据(里面可以存放UIImage对象、NSString对象【本地图片名】、NSURL对象【远程图片的URL】)
interValTime：可选设置，定时器时间设置，默认是2s
foucsDelegate：可选设置，实现滚动图片的点击

指示器操作
pageControlPosition：可选设置,指示器的为位置,默认底部中心/* LZBFocusScrollViewPageControllPosition_None,    //默认底部中心
    LZBFocusScrollViewPageControllPosition_Hidden,   //隐藏
    LZBFocusScrollViewPageControllPosition_BottomCenter,  //底部中心*/

/**
*  自定义设置分页指示器的图片
*
*  @param currentImage 选择图片
*  @param otherImage   其他图片
*/


- (void)setPageControlCurrentImage:(UIImage *)currentImage OtherImage:(UIImage *)otherImage;
/**
*  自定义设置分页指示器的颜色
*
*  @param currentColor 选中得颜色
*  @param otherColor   其他颜色
*/

#实现原理
核心思想：从当前的imageView滚动到下一个imageView，然后把下一个imageView滚动到三个imageView的中心位置，在这过程中赋值的时候是三个imageView同时赋值，滚动的时候找到距离滚动最近的一个imageView currentDelta = ABS(imageView.frame.origin.x - self.scrollView.contentOffset.x);
    把这个imageView的索引设置为当前的索引，滚动完成后把这个imageView设置为中心滚动位置。
