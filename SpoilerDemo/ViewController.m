//
//  ViewController.m
//  SpoilerDemo
//
//  Created by Sergey Yuzepovich on 19.10.14.
//  Copyright (c) 2014 Sergey Yuzepovich. All rights reserved.
//

#import "ViewController.h"
#import "SpoilerView.h"

@implementation ViewController
{
    __weak IBOutlet SpoilerView *cloudView;
    __weak IBOutlet NSLayoutConstraint *cloudViewWidth;
    __weak IBOutlet NSLayoutConstraint *cloudViewHeight;

}
- (void)viewDidLoad {
    [super viewDidLoad];

    [cloudView setupDuration:.5 constraints:@[cloudViewWidth,cloudViewHeight] dstValues:@[@160,@120]corners:10];
}

- (IBAction)btnAction:(id)sender {
    [cloudView toggleState];
}

@end
