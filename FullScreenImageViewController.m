//
//  FullScreenImageViewController.m
//  UIViewControllerTransitions
//
//  Created by Eren Demirbüken on 21/04/16.
//  Copyright © 2016 Eren Demirbüken. All rights reserved.
//

#import "FullScreenImageViewController.h"

@implementation FullScreenImageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = true;
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                 animationControllerForOperation:(UINavigationControllerOperation)operation
                                              fromViewController:(UIViewController *)fromVC
                                                toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush)
    {
        return self.presentingTransitionDelegate;
    }
    else if (operation == UINavigationControllerOperationPop)
    {
        return self.dismissingTransitionDelegate;
    }
    return nil;
}


- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    if (animationController == self.dismissingTransitionDelegate)
    {
        return self.dismissController;
    }
    return nil;
    
}

@end
