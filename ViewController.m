//
//  ViewController.m
//  UIViewControllerTransitions
//
//  Created by Eren Demirbüken on 21/04/16.
//  Copyright © 2016 Eren Demirbüken. All rights reserved.
//

#import "ViewController.h"
#import "FullScreenImageViewController.h"
#import "ImageScaleDownTransition.h"
#import "FadeInTranstition.h"
#import "InteractiveController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.imageView.layer.cornerRadius     = self.imageView.frame.size.width/2;
    self.imageView.layer.masksToBounds    = YES;
    self.imageView.userInteractionEnabled = true;
    [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)]];
}

- (void)imageTapped:(UITapGestureRecognizer * )sender
{
    FullScreenImageViewController *vc         = [[FullScreenImageViewController alloc] initWithNibName:@"FullScreenImageViewController" bundle:nil];
    ImageScaleDownTransition *imageTransition = [ImageScaleDownTransition new];
    
    imageTransition.sourceImage     = self.imageView;
    vc.dismissingTransitionDelegate = imageTransition;
    vc.presentingTransitionDelegate = [FadeInTranstition new];
    
    InteractiveController *dismissController  = [[InteractiveController alloc]initWithParentViewController:vc];
    vc.dismissController = dismissController;
    
    self.navigationController.delegate = vc;
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
