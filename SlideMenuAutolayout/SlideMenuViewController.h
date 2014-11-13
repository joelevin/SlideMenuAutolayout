//
//  SlideMenuViewController.h
//  SlideMenuAutolayout
//
//  Created by Joe Levin on 11/12/14.
//  Copyright (c) 2014 Joe Levin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuDelegate <NSObject>

- (void)animateOutMenu;

@end

@interface SlideMenuViewController : UIViewController

@property (weak, nonatomic) id<SlideMenuDelegate> delegate;


@end
