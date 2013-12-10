//
//  EventViewController.m
//  FAP
//
//  Created by Kieran Raftery on 12/10/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()

@end

@implementation EventViewController

@synthesize label, labelText, textView, textViewText;

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
    // Do any additional setup after loading the view from its nib.
    
    label.text = labelText;
    textView.text = textViewText;
    [textView setFont:[UIFont systemFontOfSize:18]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
