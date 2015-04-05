//
//  VFTDataManager.h
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 05.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VFTDataManager : NSObject

@property (nonatomic, readonly) NSMutableArray *users;

+ (VFTDataManager *)getInstance;

/** Method for getting gitHub user list. Call same method in network manager(VFTNetworkManager) throw my global data manager (VFTDataManager).
 */
- (void)getUserDataDM;

/** Method for casting gitHub user list with NSDictionary to list with VFTUser objects.
 @param uncustUsers List with data dictionaries of gitHub users.
 */
- (void)castServResponseWithUserList:(NSArray *)uncustUsers;

@end
