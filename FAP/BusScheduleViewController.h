//
//  BusScheduleViewController.h
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BusScheduleViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UILabel *warningLabel;

@end
