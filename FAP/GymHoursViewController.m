//
//  GymHoursViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "GymHoursViewController.h"

@interface GymHoursViewController ()

@end

@implementation GymHoursViewController

@synthesize ercTextView, ritchieTextView, sphTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"Gym Hours";
    
    ercTextView.text = @"Sun: 10:00 AM - Midnight\nMon - Tues: 6:00 AM - Midnight\nWed - Fri: 6:00 Am - 8:00 PM\nSat: 8:00 AM - 8:00 PM";
    ritchieTextView.text = @"Sun: 10:00 AM - Midnight\nMon - Tues: 6:00 AM - Midnight\nWed - Fri: 6:00 Am - 6:30 PM";
    sphTextView.text = @"Mon - Fri: 6:00 AM - 6:30 PM\n\nFitness Center Only";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
