//
//  SelectedLibraryViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/23/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "SelectedLibraryViewController.h"

@interface SelectedLibraryViewController ()

@end

@implementation SelectedLibraryViewController

@synthesize label, imageView, textView, labelText, imageName, textViewText;

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
    imageView.image = [UIImage imageNamed:imageName];
    textView.text = textViewText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
