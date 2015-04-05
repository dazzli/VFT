//
//  VFTUtilsManager.m
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import "VFTUtilsManager.h"

@interface VFTUtilsManager ()

@property (retain, nonatomic) MBProgressHUD *HUD;

@end

@implementation VFTUtilsManager

+ (VFTUtilsManager *)getInstance {
    static VFTUtilsManager *_sharedInstance;
    if (!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    return _sharedInstance;
}

#pragma mark - controling HUD's loading view

- (void)showLoaderWithMessage:(NSString *)loaderMsg withAutoHiding:(BOOL)isAutohide andDimBG:(BOOL)isDim {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *currentView = [[[[UIApplication sharedApplication] keyWindow] subviews] lastObject];
        _HUD = [[MBProgressHUD alloc] initWithView:currentView];
        _HUD.delegate = self;
        [currentView addSubview:_HUD];
        if (![loaderMsg isEqualToString:@""])
            [_HUD setLabelText:loaderMsg];
        [_HUD hide:YES afterDelay:10.f];
        if (isAutohide)
            [_HUD hide:YES afterDelay:1.f];
        [_HUD setDimBackground:isDim];
        [_HUD show:YES];
    });
}

- (void)hideLoadingView {
    [_HUD hide:YES afterDelay:1.f];
    [_HUD removeFromSuperview];
}

@end
