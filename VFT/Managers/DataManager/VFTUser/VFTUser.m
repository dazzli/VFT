//
//  VFTUser.m
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import "VFTUser.h"

@interface VFTUser ()

@property (nonatomic, readwrite) NSString *login;
@property (nonatomic, readwrite) NSString *profileUrl;
@property (nonatomic, readwrite) NSURL    *avatarUrl;

@end

@implementation VFTUser

- (id)initWithUserData:(NSDictionary *)userData {
    self = [super init];
    _login      = userData[@"login"];
    _profileUrl = userData[@"html_url"];
    _avatarUrl  = [NSURL URLWithString:userData[@"avatar_url"]];
    return self;
}

@end
