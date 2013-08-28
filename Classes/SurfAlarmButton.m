//
//  SurfAlarmButton.m
//  SurfAlarm
//
//  Created by Andy Dufresne on 8/27/13.
//
//

#import "SurfAlarmButton.h"
#import "UIColor+AppColors.h"
#import <UIColor+FlatUI.h>

@implementation SurfAlarmButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultColors];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self defaultColors];
    }
    return self;
}

- (void)defaultColors {
    self.buttonColor = [UIColor turquoiseColor];
    self.shadowColor = [UIColor turquoiseShadowColor];
    self.shadowHeight = 3.0f;
    self.cornerRadius = 6.0f;
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}
@end
