//
//  UI_UserTVCell.m
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 17.03.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import "VFTUserTVCell.h"

#import "VFTDataManager.h"
#import "VFTConstStr.h"
#import "VFTUser.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation VFTUserTVCell

- (void)buildCellWithRow:(NSInteger)rowIndx {
    VFTUser *currentUser = [VFTDataManager getInstance].users[rowIndx];
    _loginLbl.text = currentUser.login;
    _profileUrl.text = currentUser.profileUrl;
    [_avatarIV sd_setImageWithURL:currentUser.avatarUrl
                 placeholderImage:[UIImage imageNamed:kUI_USER_AVATAR_PLACEHOLDER]];
}

@end