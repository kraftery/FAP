//
//  LibraryHoursViewController.h
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LibraryHoursViewController : UIViewController {
    NSArray *libraries;
}

@property(nonatomic, strong) IBOutlet UITableView *myTableView;

@end
