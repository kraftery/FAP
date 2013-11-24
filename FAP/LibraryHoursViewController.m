//
//  LibraryHoursViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "LibraryHoursViewController.h"
#import "SelectedLibraryViewController.h"

@interface LibraryHoursViewController ()

@end

@implementation LibraryHoursViewController

@synthesize tableView;

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
    
    self.title = @"Library Hours";
    libraries = [[NSArray alloc] initWithObjects:@"McKeldin", @"Art", @"Architecture", @"Chemistry", @"CSPAC", @"Engineering", @"Hornbake", nil];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];//makes the tableview only display
    //the filled cells
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
    return [libraries count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    
    cell.textLabel.text = [libraries objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark-
#pragma mark Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SelectedLibraryViewController *libraryScreen = [[SelectedLibraryViewController alloc] initWithNibName:@"SelectedLibraryViewController" bundle:[NSBundle mainBundle]];
    
    switch (indexPath.row) {
        case 0:
            libraryScreen.labelText = @"McKeldin";
            libraryScreen.imageName = @"McKeldin.jpg";
            libraryScreen.textViewText = @"Week before finals: December 8 - 14\n\nSun 12/8: Open 24 hours\nMon 12/9: Open 24 hours\nTues 12/10: Open 24 hours\nWed 12/11: Open 24 hours\nThur 12/12: Open 24 hours\nFri 12/13: Open 24 hours\nSat 12/14: Open 24 hours\n\nFinals Week: December 15 - 21\n\nSun 12/15: Open 24 hours\nMon 12/16: Open 24 hours\nTues 12/17: Open 24 hours\nWed 12/18: Open 24 hours\nThur 12/19: Open 24 hours\nFri 12/20: 8:00 AM - 8:00 PM\nSat 12/21: 8:00 AM - 5:00 PM";
            break;
        case 1:
            libraryScreen.labelText = @"Art";
            libraryScreen.imageName = @"Art.jpg";
            libraryScreen.textViewText = @"Week before finals: December 8 - 14\n\nSun 12/8: 1:00 PM - 10:00 PM\nMon 12/9: 10:00 AM - 10:00 PM\nTues 12/10: 10:00 AM - 10:00 PM\nWed 12/11: 10:00 AM - 10:00 PM\nThur 12/12: 10:00 AM - 10:00 PM\nFri 12/13: 10:00 AM - 6:00 PM\nSat 12/14: 1:00 PM - 6:00 PM\n\nFinals Week: December 15 - 21\n\nSun 12/15: 1:00 PM - 10:00 PM\nMon 12/16: 10:00 AM - 10:00 PM\nTues 12/17: 10:00 AM - 10:00 PM\nWed 12/18: 10:00 AM - 10:00 PM\nThur 12/19: 10:00 AM - 10:00 PM\nFri 12/20: 10:00 AM - 6:00 PM\nSat 12/21: 1:00 PM - 6:00 PM";
            break;
        case 2:
            libraryScreen.labelText = @"Architecture";
            libraryScreen.imageName = @"Architecture.jpg";
            libraryScreen.textViewText = @"Week Before Finals: December 8 - 14\n\nSun 12/8: 1:00 PM - 10:00 PM\nMon 12/9: 10:00 AM - 10:00 PM\nTues 12/10: 10:00 AM - 10:00 PM\nWed 12/11: 10:00 AM - 10:00 PM\nThur 12/12: 10:00 AM - 10:00 PM\nFri 12/13: 10:00 AM - 6:00 PM\nSat 12/14: 1:00 PM - 6:00 PM\n\nFinals Week: December 15 - 21\n\nSun 12/15: 1:00 PM - 10:00 PM\nMon 12/16: 10:00 AM - 10:00 PM\nTues 12/17: 10:00 AM - 10:00 PM\nWed 12/18: 10:00 AM - 10:00 PM\nThur 12/19: 10:00 AM - 10:00 PM\nFri 12/20: 10:00 AM - 6:00 PM\nSat 12/21: 1:00 PM - 6:00 PM";
            break;
        case 3:
            libraryScreen.labelText = @"Chemistry";
            libraryScreen.imageName = @"Chemistry.jpg";
            libraryScreen.textViewText = @"Week Before Finals: December 8 - 14\n\nSun 12/8: 12:00 PM - 11:00 PM\nMon 12/9: 8:00 AM - 11:00 PM\nTues 12/10: 8:00 AM - 11:00 PM\nWed 12/11: 8:00 AM - 11:00 PM\nThur 12/12: 8:00 AM - 11:00 PM\nFri 12/13: 8:00 AM - 8:00 PM\nSat 12/14: 10:00 AM - 8:00 PM\n\nFinals Week: December 15 - 21\n\nSun 12/15: 12:00 PM - 11:00 PM\nMon 12/16: 8:00 AM - 11:00 PM\nTues 12/17: 8:00 AM - 11:00 PM\nWed 12/18: 8:00 AM - 11:00 PM\nThur 12/19: 8:00 AM - 11:00 PM\nFri 12/20: 8:00 AM - 8:00 PM\nSat 12/21: 10:00 AM - 5:00 PM";
            break;
        case 4:
            libraryScreen.labelText = @"CSPAC";
            libraryScreen.imageName = @"CSPAC.jpg";
            libraryScreen.textViewText = @"Week Before Finals: December 8 - 14\n\nSun 12/8: 1:00 PM - 11:00 PM\nMon 12/9: 8:30 AM - 11:00 PM\nTues 12/10: 8:30 AM - 11:00 PM\nWed 12/11: 8:30 AM - 11:00 PM\nThur 12/12: 8:30 AM - 11:00 PM\nFri 12/13: 8:30 AM - 6:00 PM\nSat 12/14: 12:00 PM - 5:00 PM\n\nFinals Week: December 15 - 21\n\nSun 12/15: 1:00 PM - 11:00 PM\nMon 12/16: 8:30 AM - 11:00 PM\nTues 12/17: 8:30 AM - 11:00 PM\nWed 12/18: 8:30 AM - 11:00 PM\nThur 12/19: 8:30 AM - 11:00 PM\nFri 12/20: 8:30 AM - 6:00 PM\nSat 12/21: 12:00 PM - 5:00 PM";

            break;
        case 5:
            libraryScreen.labelText = @"Engineering";
            libraryScreen.imageName = @"Engineering.jpg";
            libraryScreen.textViewText = @"Week Before Finals: December 8 - 14\n\nSun 12/8: 12:00 PM - 11:00 PM\nMon 12/9: 8:00 AM - 11:00 PM\nTues 12/10: 8:00 AM - 11:00 PM\nWed 12/11: 8:00 AM - 11:00 PM\nThur 12/12: 8:00 AM - 11:00 PM\nFri 12/13: 8:00 AM - 2:00 AM\nSat 12/14: 10:00 AM - 2:00 AM\n\nFinals Week: December 15 - 21\n\nSun 12/15: 12:00 PM - 2:00 AM\nMon 12/16: 8:00 AM - 2:00 AM\nTues 12/17: 8:00 AM - 2:00 AM\nWed 12/18: 8:00 AM - 2:00 AM\nThur 12/19: 8:00 AM - 2:00 AM\nFri 12/20: 8:00 AM - 2:00 AM\nSat 12/21: 10:00 AM - 5:00 PM";
            break;
        case 6:
            libraryScreen.labelText = @"Hornbake";
            libraryScreen.imageName = @"Hornbake.jpg";
            libraryScreen.textViewText = @"Week Before Finals: December 8 - 14\n\nSun 12/8: 1:00 PM - 10:00 PM\nMon 12/9: 8:00 AM - 10:00 PM\nTues 12/10: 8:00 AM - 10:00 PM\nWed 12/11: 8:00 AM - 10:00 PM\nThur 12/12: 8:00 AM - 10:00 PM\nFri 12/13: 8:00 AM - 8:00 PM\nSat 12/14: 12:00 PM - 5:00 PM\n\nFinals Week: December 15 - 21\n\nSun 12/15: 1:00 PM - 10:00 PM\nMon 12/16: 8:00 AM - 10:00 PM\nTues 12/17: 8:00 AM - 10:00 PM\nWed 12/18: 8:00 AM - 10:00 PM\nThur 12/19: 8:00 AM - 10:00 PM\nFri 12/20: 8:00 AM - 6:00 PM\nSat 12/21: 12:00 PM - 5:00 PM";

            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:libraryScreen animated:YES];
}

@end
