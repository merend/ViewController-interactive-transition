//
//  InteractiveController.h
//  ViewControllerTransition
//
//  Created by Eren Demirbüken on 15/04/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InteractiveController : UIPercentDrivenInteractiveTransition
-(id)initWithParentViewController:(UIViewController *)viewController;
@end
