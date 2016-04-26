//
//  InteractiveController.m
//  ViewControllerTransition
//
//  Created by Eren Demirbüken on 15/04/16.
//

#import "InteractiveController.h"

@interface InteractiveController ()

@property(nonatomic,weak) UIViewController * parentViewController;

@property(nonatomic) bool    shouldCompleteTransition;
@property(nonatomic) bool    transitionInProgress;
@property(nonatomic) CGFloat percent;

-(id)initWithParentViewController:(UIViewController *)viewController;
@end

@implementation InteractiveController


-(id)initWithParentViewController:(UIViewController *)viewController
{
    self = [super init];
    
    if (self)
    {
        self.parentViewController = viewController;
        self.shouldCompleteTransition = false;
        self.transitionInProgress = false;
        
        [self setUpGestureRecognizer];
    }
    return self;
}

-(void) setUpGestureRecognizer
{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    panGesture.delegate = (id <UIGestureRecognizerDelegate>)self;
    [self.parentViewController.view addGestureRecognizer:panGesture];
}

- (void)didPan:(UIPanGestureRecognizer *)gesture
{
    CGPoint point = [gesture translationInView:self.parentViewController.view];
    self.percent = fmaxf(fminf((point.y/ 400.0), 0.99), 0.0);
    CGPoint velocity = [gesture velocityInView:self.parentViewController.view];
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            self.transitionInProgress = true;
            [self.parentViewController.navigationController popViewControllerAnimated:YES];
            break;
        }
            
        case UIGestureRecognizerStateChanged:
        {
            self.shouldCompleteTransition = (self.percent > 0.7 );
      
            NSLog(@"%@", NSStringFromCGPoint(velocity));
            [self updateInteractiveTransition:self.percent];
            break;
        }
            
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled :
        {
            self.transitionInProgress = false;
            if (self.shouldCompleteTransition  == false || gesture.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
                
            }else{
                [self finishInteractiveTransition];
            }
            
            break;
        }
        default:
        {
            break;
        }
            
    }
}

@end
