//
//  DiningHoursViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "DiningHoursViewController.h"
#import "CouponViewController.h"

@interface DiningHoursViewController ()

@end

@implementation DiningHoursViewController
@synthesize couponTable;

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
    
    self.title = @"Food Deals";
    
    restaurants = [[NSArray alloc] initWithObjects:@"Auntie Anne's",@"Bagel Place", @"RJ Bentley's", @"DP Dough", @"Pizza Kingdom", @"Ten Ren", @"The Stamp", nil];
    couponTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//makes the tableview only display
    //the filled cells
    couponTable.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table view data source

-(NSInteger)numberOfSectionsOfTableView:(UITableView *) tableView {
    //return the number of sections
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return the number of rows in the section
    return [restaurants count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [restaurants objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark-
#pragma mark Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CouponViewController *controller = [[CouponViewController alloc] initWithNibName:@"CouponViewController" bundle:[NSBundle mainBundle]];
    
    switch (indexPath.row) {
        case 0:
            controller.imageName = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"auntie_annes.png"]];
            break;
        case 1:
            controller.imageName = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"auntie_annes.png"]];
            break;
        case 2:
            controller.imageName = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"bentleys.png"]];
            break;
        case 3:
            controller.imageName = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"dp_dough.png"]];
            break;
        case 4:
            controller.imageName = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"pizza_kingdom.png"]];
            break;
        case 5:
            controller.imageName = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"stamp.png"]];
            break;
       
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
