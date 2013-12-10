//
//  MyScheduleViewController.h
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScheduleViewController : UIViewController {
    
    NSMutableArray *myExams;
}

@property(nonatomic, strong) IBOutlet UITableView *myTableView;

-(IBAction)addButtonClick:(id)sender;

@end
