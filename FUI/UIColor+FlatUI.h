//
//  UIColor+FlatUI.h
//  FlatUI
//
//  Created by Jack Flintermann on 5/3/13.
//  Copyright (c) 2013 Jack Flintermann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FlatUI)

+ (UIColor *) colorFromHexCode:(NSString *)hexString;

+ (UIColor *) turquoiseColor;
+ (UIColor *) turquoiseShadowColor;
+ (UIColor *) fadedColor;
+ (UIColor *) cancelRedColor;
+ (UIColor *) redShadowColor;

+ (UIColor *) blendedColorWithForegroundColor:(UIColor *)foregroundColor
                              backgroundColor:(UIColor *)backgroundColor
                                 percentBlend:(CGFloat) percentBlend;

@end
