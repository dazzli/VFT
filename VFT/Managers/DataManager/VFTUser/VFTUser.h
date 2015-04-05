//
//  VFTUser.h
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VFTUser : NSObject

@property (nonatomic, readonly) NSString *login;
@property (nonatomic, readonly) NSString *profileUrl;
@property (nonatomic, readonly) NSURL    *avatarUrl;

- (id)initWithUserData:(NSDictionary *)userData;

@end
