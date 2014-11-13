//
//  SlideMenuViewController.m
//  SlideMenuAutolayout
//
//  Created by Joe Levin on 11/12/14.
//  Copyright (c) 2014 Joe Levin. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()

@end

@implementation SlideMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeButtonHandler:(id)sender
{
    if (self.delegate != nil)
    {
        if ([self.delegate respondsToSelector:@selector(animateOutMenu)])
        {
            [self.delegate animateOutMenu];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
