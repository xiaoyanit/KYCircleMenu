//
//  CircleMenuViewController.m
//  KYCircleMenuDemo
//
//  Created by Kjuly on 7/18/12.
//  Copyright (c) 2012 Kjuly. All rights reserved.
//

#import "CircleMenuViewController.h"

@interface CircleMenuViewController ()

@end

@implementation CircleMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Set root menu's title
  [self setTitle:@"KYCircleMenu"];
  
  // Set Buttons' style in center menu view
  for (UIButton * button in [self.centerMenu subviews]) {
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:kKYICircleMenuButton, button.tag]]
            forState:UIControlStateNormal];
    [button setAlpha:.95f];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - KYCircleMenu Button Action

- (void)runButtonActions:(id)sender {
  [super runButtonActions:sender];
  
  // change |centerMainButton_|'s status
  [self changeCenterMainButtonStatusToMove:kCenterMainButtonStatusAtBottom];
  
  // configure new view & push it with custom |pushViewController:| method
  UIViewController * viewController = [[UIViewController alloc] init];
  [viewController.view setBackgroundColor:[UIColor blackColor]];
  [viewController setTitle:[NSString stringWithFormat:@"%d", [sender tag]]];
  [self pushViewController:viewController];
  [viewController release];
}

@end