//
//  CouponViewController.m
//  FAP
//
//  Created by Admin on 10/12/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "CouponViewController.h"
//#import "CGGeometry.h"

@interface CouponViewController ()

@end

@implementation CouponViewController
@synthesize scrollView;
@synthesize imageName;

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
    [self.imageName sizeToFit];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 100.0;
    [self.scrollView addSubview:imageName];
    
    //self.scrollView.contentSize = image.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageName;
}
@end
