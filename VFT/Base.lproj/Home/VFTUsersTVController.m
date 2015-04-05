//
//  UsersTVC.m
//  VFT
//
//  Created by Valentyn Fesenko mac mini on 01.04.15.
//  Copyright (c) 2015 Valentyn Fesenko. All rights reserved.
//

#import "VFTUsersTVController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "VFTUserTVCell.h"
#import "VFTDataManager.h"

#import "VFTConstStr.h"

@interface VFTUsersTVController ()

@property (strong, nonatomic) IBOutlet UITableView *usersTV;

@end

// use auto synthesizing

@implementation VFTUsersTVController

#pragma mark - Table view controller lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRefreshControl];
    self.clearsSelectionOnViewWillAppear = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [self turnONRadioStation];
}

#pragma mark - Refresh control for table view

- (void)addRefreshControl {
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:kALERT_TITLE_WAIT];
    [refreshControl addTarget:self action:@selector(refrestTV:) forControlEvents:UIControlEventValueChanged];
    [_usersTV addSubview:refreshControl];
}

- (void)refrestTV:(UIRefreshControl *)refreshControl {
    [[VFTDataManager getInstance] getUserDataDM];
    [refreshControl endRefreshing];
}

#pragma mark - Radio station

- (void)turnONRadioStation {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reloadUserTV)
                                                 name:kNOTIF_USER_DATA_RECEIVED
                                               object:nil];
    [[VFTDataManager getInstance] getUserDataDM];
}

#pragma mark - Table view data source

- (void)reloadUserTV {
    [_usersTV reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ([VFTDataManager getInstance].users)? [[VFTDataManager getInstance].users count] : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VFTUserTVCell *userTVCell = (VFTUserTVCell *)[tableView dequeueReusableCellWithIdentifier:kUI_USER_TVC_ID
                                                                                 forIndexPath:indexPath];
    if (userTVCell == nil) {
        userTVCell = (VFTUserTVCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                             reuseIdentifier:kUI_USER_TVC_ID];
    }
    [userTVCell buildCellWithRow:indexPath.row];
    return userTVCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end