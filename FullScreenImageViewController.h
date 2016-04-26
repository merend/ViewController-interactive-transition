//
//  FullScreenImageViewController.h
//  UIViewControllerTransitions
//
//  Created by Eren Demirbüken on 21/04/16.
//  Copyright © 2016 Eren Demirbüken. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InteractiveController.h"


@interface FullScreenImageViewController : UIViewController<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>
@property (nonatomic,strong) IBOutlet id <UIViewControllerAnimatedTransitioning> presentingTransitionDelegate;
@property (nonatomic,strong) IBOutlet id <UIViewControllerAnimatedTransitioning> dismissingTransitionDelegate;
@property (nonatomic,strong) InteractiveController * dismissController;
@end
