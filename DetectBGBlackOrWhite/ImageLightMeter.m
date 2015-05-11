//
//  ImageLightMeter.m
//  DetectBGBlackOrWhite
//
//  Created by Olarn U. on 5/11/2558 BE.
//  Copyright (c) 2558 G-ABLE Co., Ltd. All rights reserved.
//

#import "ImageLightMeter.h"
#import "ImageMeter.h"

struct pixel {
    unsigned char r, g, b, a;
};

@interface ImageLightMeter ()

@property (nonatomic, strong) UIImage * sourceImage;
@property (nonatomic, strong) NSMutableArray *resultColor;


@end

@implementation ImageLightMeter

- (BOOL) imageIsLightForImage:(UIImage*)image fromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint
{
    _resultColor = [NSMutableArray array];
    
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    // Now your rawData contains the image data in the RGBA8888 pixel format.
    // Convert all of its into gray scale
    
    int byteIndex = (bytesPerRow * fromPoint.y) + fromPoint.x * bytesPerPixel;
    int latestIndex = (bytesPerRow * toPoint.y) + toPoint.x * bytesPerPixel;
    
    int sumRed = 0;
    int sumGreen = 0;
    int sumBlue = 0;
    
    int count = 0;
    
    while (byteIndex < latestIndex) {
        
        sumRed += rawData[byteIndex];
        sumGreen += rawData[byteIndex + 1];
        sumBlue += rawData[byteIndex + 2];

        byteIndex += 4;
        count++;
    }
    
    free(rawData);
    
    sumRed = sumRed / count;
    sumGreen = sumGreen / count;
    sumBlue = sumBlue / count;
 
    NSLog(@"Avg RGB = %d, %d, %d", sumRed, sumGreen, sumBlue);
    
    int vote = 0;

    if (sumRed >= 153) {
        vote++;
    }
    if (sumGreen >= 153) {
        vote++;
    }
    if (sumBlue >= 153) {
        vote++;
    }
 
    if (vote >= 2) {
        return YES;
    } else
        return NO;
}

- (id)initWithImage:(UIImage *)image
{
    self = [self init];
    if (self) {
        self.sourceImage = image;
        
    }
    return self;
}

@end
