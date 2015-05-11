//
//  ImageLightMeter.h
//  DetectBGBlackOrWhite
//
//  Created by Olarn U. on 5/11/2558 BE.
//  Copyright (c) 2558 G-ABLE Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageLightMeter : NSObject

- (id)initWithImage:(UIImage *)image;
- (BOOL) imageIsLightForImage:(UIImage*)image fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;

@end
