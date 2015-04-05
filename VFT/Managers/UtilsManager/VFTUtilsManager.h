//
//  VFTUtilsManager.h
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface VFTUtilsManager : NSObject <MBProgressHUDDelegate>

+ (VFTUtilsManager *)getInstance;

/** Build my custom UITableViewCell with four(now) UIImageView for showing photo's thumbneil.
 @param loaderMsg  Loader message for HUD element
 @param isAutohide Flag for set auto hiding param to HUD element
 @param isDim      Flag for set dim background param of HUD element
 */
- (void)showLoaderWithMessage:(NSString *)loaderMsg withAutoHiding:(BOOL)isAutohide andDimBG:(BOOL)isDim;

/** Hide HUD elemt
 */
- (void)hideLoadingView;

/** Method for showing alert with 
 @param alertTitle String for alert title
 @param isDim      
 */
- (void)showAlertWithTitleString:(NSString *)titleStr andMessage:(NSString *)message;

@end
