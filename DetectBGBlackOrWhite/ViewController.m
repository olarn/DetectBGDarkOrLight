//
//  ViewController.m
//  DetectBGBlackOrWhite
//
//  Created by Olarn U. on 5/11/2558 BE.
//  Copyright (c) 2558 G-ABLE Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ImageLightMeter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ImageLightMeter * meter = [[ImageLightMeter alloc] initWithImage:self.imgBackground.image];
    
    if ([meter imageIsLightForImage:self.imgBackground.image
                          fromPoint:CGPointMake(_lblTop.frame.origin.x, _lblTop.frame.origin.y)
                            toPoint:CGPointMake(_lblTop.frame.origin.x + _lblTop.frame.size.width,
                                                _lblTop.frame.origin.y + _lblTop.frame.size.height)])
    {
        _lblTop.textColor = [UIColor blackColor];
    } else
        _lblTop.textColor = [UIColor whiteColor];
    
    if ([meter imageIsLightForImage:self.imgBackground.image
                          fromPoint:CGPointMake(_lblTitle.frame.origin.x, _lblTitle.frame.origin.y)
                            toPoint:CGPointMake(_lblSynopsis.frame.origin.x + _lblSynopsis.frame.size.width,
                                                _lblSynopsis.frame.origin.y + _lblSynopsis.frame.size.height)])
    {
        _lblTitle.textColor = [UIColor blackColor];
        _lblSubTitle.textColor = [UIColor blackColor];
        _lblSynopsis.textColor = [UIColor blackColor];
    } else {
        _lblTitle.textColor = [UIColor whiteColor];
        _lblSubTitle.textColor = [UIColor whiteColor];
        _lblSynopsis.textColor = [UIColor whiteColor];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
