//
//  VFTNetworkManager.m
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import "VFTNetworkManager.h"
#import "AFNetworking.h"

#import "VFTDataManager.h"
#import "VFTUtilsManager.h"

#import "VFTConstStr.h"

@implementation VFTNetworkManager

+ (void)getUserDataNM {
    [[AFHTTPRequestOperationManager manager] GET:kAPI_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[VFTDataManager getInstance] castServResponseWithUserList:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[VFTUtilsManager getInstance] showAlertWithTitleString:kALERT_TITLE_ERROR andMessage:[error localizedDescription]];
    }];
}

@end
