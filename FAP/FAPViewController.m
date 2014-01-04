//
//  FAPViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "FAPViewController.h"
#import <unistd.h>

@interface FAPViewController ()

@end

@implementation FAPViewController
@synthesize about;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Menu";
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        about.frame = CGRectMake(0, 524, 320, 44);
    } else {
        about.frame = CGRectMake(0, 436, 320, 44);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)appDidFinishLaunching
{
    sleep(5);
}*/

- (void)dealloc {
    [super dealloc];
}
@end