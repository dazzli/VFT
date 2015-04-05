//
//  VFTNetworkManager.h
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VFTNetworkManager : NSObject

/** Make request with GitHub API_URL for getting list of users. 
 */
+ (void)getUserDataNM;

@end
