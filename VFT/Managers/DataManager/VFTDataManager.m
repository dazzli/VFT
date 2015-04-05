//
//  VFTDataManager.m
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import "VFTDataManager.h"
#import "VFTNetworkManager.h"
#import "VFTUtilsManager.h"

#import "VFTConstStr.h"
#import "VFTUser.h"

@interface VFTDataManager ()

@property (nonatomic, readwrite) NSMutableArray *users;

@end

@implementation VFTDataManager

+ (VFTDataManager *)getInstance {
    static VFTDataManager *_sharedInstance;
    if (!_sharedInstance) {
        static dispatch_once_t oncePredicate;
        dispatch_once(&oncePredicate, ^{
            _sharedInstance = [[super allocWithZone:nil] init];
        });
    }
    return _sharedInstance;
}

- (void)getUserDataDM {
    [[VFTUtilsManager getInstance] showLoaderWithMessage:kLOADER_TITLE_WAIT withAutoHiding:YES andDimBG:YES];
    [VFTNetworkManager getUserDataNM];
}

- (void)castServResponseWithUserList:(NSArray *)uncustUsers {
    if (!_users) _users = [NSMutableArray new];
    if ([self isFilledUserlList:uncustUsers]) {
        [_users removeAllObjects];
        [uncustUsers enumerateObjectsUsingBlock:^(id someUserData, NSUInteger idx, BOOL *stop) {
            [_users addObject:[[VFTUser alloc] initWithUserData:someUserData]];
        }];
        [[NSNotificationCenter defaultCenter] postNotificationName:kNOTIF_USER_DATA_RECEIVED object:nil];
    }
    [[VFTUtilsManager getInstance] hideLoadingView];
}

- (BOOL)isFilledUserlList:(NSArray *)uncustUsers {
    return (uncustUsers || [uncustUsers count] != 0);
}

@end
