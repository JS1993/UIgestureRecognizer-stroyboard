//
//  ViewController.m
//  Demo5_UIgestureRecognizer-stroyboard
//
//  Created by  江苏 on 16/2/29.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
@implementation ViewController
- (void)relocation
{
    float scaleX = self.view.frame.size.width  / self.imageView.bounds.size.width;
    float scaleY = self.view.frame.size.height / self.imageView.bounds.size.height;
    float scale = scaleX<scaleY?scaleX:scaleY;
    self.imageView.transform = CGAffineTransformMakeScale(scale, scale);
}
-(void)viewDidLoad{
    [super viewDidLoad];
    //打开用户交互,在检查器4中可以打开
    //self.imageView.userInteractionEnabled=YES;
}
- (IBAction)rotation:(UIRotationGestureRecognizer *)sender {
    self.imageView.transform=CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    sender.rotation=0;
}
- (IBAction)pinch:(UIPinchGestureRecognizer *)sender {
    self.imageView.transform=CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    sender.scale=1;
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    CGPoint p=[sender translationInView:self.imageView];
    self.imageView.transform=CGAffineTransformTranslate(self.imageView.transform, p.x, p.y);
    [sender setTranslation:CGPointZero inView:self.imageView];
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    [self relocation];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
@end
