//
//  EventsViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "EventsViewController.h"
#import "EventViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

@synthesize myTableView;

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
    
    self.title = @"Events";
    
    days = [[NSArray alloc] initWithObjects:@"Sunday, December 15", @"Monday, December 16", @"Tuesday, December 17", @"Wednesday, December 18", @"Thursday, December 19", @"Friday, December 20", nil];
    
    myTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    myTableView.backgroundColor = [UIColor clearColor];
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
    return [days count];
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
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [days objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark-
#pragma mark Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EventViewController *eventScreen = [[EventViewController alloc] initWithNibName:@"EventViewController" bundle:[NSBundle mainBundle]];
    
    switch (indexPath.row) {
        case 0:
            eventScreen.labelText = [days objectAtIndex:indexPath.row];
            eventScreen.textViewText = @"Yoga\n\nCome relax your mind and your muscles with a calming session of yoga lead by an instructor from the Campus Recreation Services.\n\nTime: 7:30 PM\nLocation: Stamp Activities Room (next to TerpZone)";
            break;
        case 1:
            eventScreen.labelText = [days objectAtIndex:indexPath.row];
            eventScreen.textViewText = @"Open Study Rooms\n\nStudy in Stamp during Stamp's hours of operation\n\nTime: 7:00 AM - 12:00 AM\nLocation: Atrium and Prince George’s Room – Stamp\n__________________________________\n\nFun With MICA!\n\nColoring isn’t just for kids! Drop in and color a turtle while enjoying tea, coffee, or hot cocoa. Also, stop in and create an art or jewelry piece that is representative of your identity or a social cause.\n\nTime: 8:30 AM - 5:00 PM\nLocation: MICA Lounge – 1120 Stamp\n__________________________________\n\nFree Massages\n\nTime: 11:00 AM - 2:00 PM\nLocation: Grand Ballroom Lounge –  1209 Stamp\n__________________________________\n\nNational Maple Syrup Day Celebration!\n\nTime: 9:00 AM\nLocation:Grand Ballroom Lounge –  1209 Stamp";
            break;
        case 2:
            eventScreen.labelText = [days objectAtIndex:indexPath.row];
            eventScreen.textViewText = @"Open Study Rooms\n\nStudy in Stamp during Stamp's hours of operation\n\nTime: 7:00 AM - 12:00 AM\nLocation: Atrium and Prince George’s Room – Stamp\n__________________________________\n\nFun With MICA!\n\nColoring isn’t just for kids! Drop in and color a turtle while enjoying tea, coffee, or hot cocoa. Also, stop in and create an art or jewelry piece that is representative of your identity or a social cause.\n\nTime: 8:30 AM - 5:00 PM\nLocation: MICA Lounge – 1120 Stamp\n__________________________________\n\nCookie Decorating\n\nIcing or sprinkles? Why not both! Join us to decorate a cookie to snack on while you study.\n\nTime: 11:00 AM\nLocation: MICA Lounge – 1120 Stamp\n__________________________________\n\nPuppy Palooza!\n\nTHE PUPPIES ARE BACK! Come relax by playing with some ADORABLE puppies from an animal rescue shelter.\n\nTime: 11:00 AM - 1:00 PM\nLocation:Grand Ballroom Lounge –  1209 Stamp";
            break;
        case 3:
            eventScreen.labelText = [days objectAtIndex:indexPath.row];
            eventScreen.textViewText = @"Open Study Rooms\n\nStudy in Stamp during Stamp's hours of operation\n\nTime: 7:00 AM - 12:00 AM\nLocation: Atrium and Prince George’s Room – Stamp\n__________________________________\n\nFun With MICA!\n\nColoring isn’t just for kids! Drop in and color a turtle while enjoying tea, coffee, or hot cocoa. Also, stop in and create an art or jewelry piece that is representative of your identity or a social cause.\n\nTime: 8:30 AM - 5:00 PM\nLocation: MICA Lounge – 1120 Stamp\n__________________________________\n\nGame Hour\n\nTake a break and join MICA staff for fun games\n\nTime: 3:00 PM - 4:00 PM\nLocation: MICA Lounge – 1120 Stamp\n__________________________________\n\nMuffins and Fruit\n\nCome enjoy a light breakfast to jumpstart your studying\n\nTime: 10:30 AM\nLocation: Prince George's Room –  Stamp\n__________________________________\n\nWinter Solstice Labyrinth Walk\n\nBid farewell to regrets of the old year as you walk into the Labyrinth and welcome back the sun with your own lit candle as you walk out! Create a glittery hand-held labyrinth to reflect the winter light at home. Hot drinks served.\n\nTime: 3:30 PM - 5:30 PM\n\nLocation: Memorial Chapel - Garden of Reflection and Remembrance";
            break;
        case 4:
            eventScreen.labelText = [days objectAtIndex:indexPath.row];
            eventScreen.textViewText = @"Open Study Rooms\n\nStudy in Stamp during Stamp's hours of operation\n\nTime: 7:00 AM - 12:00 AM\nLocation: Atrium and Prince George’s Room – Stamp\n__________________________________\n\nFun With MICA!\n\nColoring isn’t just for kids! Drop in and color a turtle while enjoying tea, coffee, or hot cocoa. Also, stop in and create an art or jewelry piece that is representative of your identity or a social cause.\n\nTime: 8:30 AM - 5:00 PM\nLocation: MICA Lounge – 1120 Stamp";
            break;
        case 5:
            eventScreen.labelText = [days objectAtIndex:indexPath.row];
            eventScreen.textViewText = @"Open Study Rooms\n\nStudy in Stamp during Stamp's hours of operation\n\nTime: 7:00 AM - 12:00 AM\nLocation: Atrium and Prince George’s Room – Stamp\n__________________________________\n\nFun With MICA!\n\nColoring isn’t just for kids! Drop in and color a turtle while enjoying tea, coffee, or hot cocoa. Also, stop in and create an art or jewelry piece that is representative of your identity or a social cause.\n\nTime: 8:30 AM - 5:00 PM\nLocation: MICA Lounge – 1120 Stamp";
            break;
            
        default:
            break;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:eventScreen animated:YES];
}

@end
