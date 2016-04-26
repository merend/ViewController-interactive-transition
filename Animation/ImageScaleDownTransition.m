//
//  ImageScaleDownTransition.m
//
//  Created by Eren Demirbuken on 20/04/16.
//

#import "ImageScaleDownTransition.h"

@implementation ImageScaleDownTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contextView      = [transitionContext containerView];
    
    [contextView addSubview:toVC.view];
    
    UIView *sourceSnap = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    sourceSnap.frame   = fromVC.view.frame;
    
    [contextView addSubview:sourceSnap];
    
    CGRect initialFrame = CGRectMake(-fromVC.view.frame.size.width/2,0, fromVC.view.frame.size.height, fromVC.view.frame.size.height );
    CGRect endFrame     = self.sourceImage.frame;
    
    UIBezierPath * maskPath  = [UIBezierPath bezierPathWithOvalInRect:initialFrame];
    CAShapeLayer * maskLayer = [CAShapeLayer new];
    maskLayer.frame          = toVC.view.frame;
    maskLayer.path           = maskPath.CGPath;
    
    UIBezierPath * smallCirclePath = [UIBezierPath bezierPathWithOvalInRect:endFrame];
    maskLayer.path = smallCirclePath.CGPath;
    sourceSnap.layer.mask = maskLayer;
    
    CABasicAnimation * pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.fromValue = (__bridge id _Nullable)(maskPath.CGPath);
    pathAnimation.toValue   = smallCirclePath;
    pathAnimation.duration  = [self transitionDuration:transitionContext];
    
    CABasicAnimation * opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = @(1.0);
    opacityAnimation.toValue   = @(0.5);
    opacityAnimation.duration  = [self transitionDuration:transitionContext];
    
    [CATransaction begin]; {
        [CATransaction setCompletionBlock:^{
            toVC.view.layer.mask = nil;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            [sourceSnap removeFromSuperview];
        }];
        
        [maskLayer addAnimation:pathAnimation forKey:@"pathAnimation"];
        [maskLayer addAnimation:opacityAnimation forKey:@"opacityAnimation"];
        
    } [CATransaction commit];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.2;
}

@end
