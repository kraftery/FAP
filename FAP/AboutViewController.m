//
//  AboutViewController.m
//  FAP
//
//  Created by Admin on 07/12/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize textView;

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
    textView.text = @"Thank you for downloading the Finals App. For bug reports please email us at: mobileappdevelopersclub@gmail.com\n\nThe Student Governing Association came up the app idea and it was developed by students who are members of the Mobile App Developers club(MAD). You can learn how to make apps like this, just email us to get more information. Below is the list of SGA Members and Developers who worked on the app.\n\nSGA Members:\nMeenu Singh\nHarry Webb\nLaura Pavlo\nEshe Hill\n\nDEVELOPERS:\nBori Oludemi\nVinnie Vendemia\nEly Shamouilian\nDylan Zingler\nKieran Raftery\nGarrett Mohammadioun\nDavid Lobosco\nSuprana Chowdhury\n\nRespectfully,\nMobile App Developers Club Officers";
    textView.dataDetectorTypes = UIDataDetectorTypeLink; //if you click on the email, it will open your mail app to email
    textView.font = [UIFont fontWithName:@"Verdana" size:16.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [textView release];
    [super dealloc];
}
@end
