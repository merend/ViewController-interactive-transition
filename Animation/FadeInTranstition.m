//
//  FadeInTranstition.m
//
//  Created by Eren Demirbuken on 18/04/16.
//

#import "FadeInTranstition.h"

@implementation FadeInTranstition


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contextView      = [transitionContext containerView];
    
    [contextView insertSubview:toVC.view aboveSubview:fromVC.view];
    toVC.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.alpha = 1.0;
    }completion:^(BOOL finished)
    {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

@end
