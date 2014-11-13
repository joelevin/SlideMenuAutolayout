//
//  ViewController.m
//  SlideMenuAutolayout
//
//  Created by Joe Levin on 11/12/14.
//  Copyright (c) 2014 Joe Levin. All rights reserved.
//

#import "ViewController.h"
#import "SlideMenuViewController.h"

@interface ViewController () <SlideMenuDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) NSLayoutConstraint *slideMenuLeft;
@property (nonatomic, strong) NSLayoutConstraint *slideMenuWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewLeft;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewRight;
@property (nonatomic, strong) SlideMenuViewController *slideMenu;
@end

@implementation ViewController

const CGFloat ANIMATION_DURATION = 0.25f;
const CGFloat DELAY = 0.0f;
const CGFloat DAMPING = 1.0f;
const CGFloat VELOCITY = 0.80f;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.slideMenu = [[SlideMenuViewController alloc] init];
    self.slideMenu.delegate = self;
    self.slideMenu.view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.slideMenu.view];

    CGFloat percentageMultiplier = 0.80f; // 80%
    self.slideMenuWidth = [NSLayoutConstraint constraintWithItem:self.slideMenu.view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:percentageMultiplier constant:0];
    [self.view addConstraint:self.slideMenuWidth];

    NSLayoutConstraint *slideMenuHeight = [NSLayoutConstraint constraintWithItem:self.slideMenu.view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:slideMenuHeight];

    self.slideMenuLeft = [NSLayoutConstraint constraintWithItem:self.slideMenu.view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.containerView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:self.slideMenuLeft];

    NSLayoutConstraint *slideMenuTop = [NSLayoutConstraint constraintWithItem:self.slideMenu.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:slideMenuTop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMenu:(id)sender
{
    self.containerViewLeft.constant -= self.slideMenu.view.frame.size.width;
    self.containerViewRight.constant += self.slideMenu.view.frame.size.width;

    [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY usingSpringWithDamping:DAMPING initialSpringVelocity:VELOCITY options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)animateOutMenu
{

    self.containerViewLeft.constant += self.slideMenu.view.frame.size.width;
    self.containerViewRight.constant -= self.slideMenu.view.frame.size.width;

    [UIView animateWithDuration:ANIMATION_DURATION delay:DELAY usingSpringWithDamping:DAMPING initialSpringVelocity:VELOCITY options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

@end
