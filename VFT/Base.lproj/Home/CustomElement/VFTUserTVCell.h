//
//  UI_UserTVCell.h
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 17.03.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VFTUser.h"

@interface VFTUserTVCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarIV;
@property (weak, nonatomic) IBOutlet UILabel     *loginLbl;
@property (weak, nonatomic) IBOutlet UILabel     *profileUrl;

/** Method for filling my custom tableview cell(VFTUserTVCell)
 @param rowIndx Index of tableview cell. Use to get user data from "users" field in VFTDataManager 
 */
- (void)buildCellWithRow:(NSInteger)rowIndx;

@end
