//
//  ImageScaleDownTransition.h
//
//  Created by Eren Demirbuken on 20/04/16.
//

#import <Foundation/Foundation.h>

@interface ImageScaleDownTransition :NSObject <UIViewControllerAnimatedTransitioning>
@property(nonatomic,strong) UIView *sourceImage;
@end
