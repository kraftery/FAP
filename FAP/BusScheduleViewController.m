#import "BusScheduleViewController.h"
#import "BusViewController.h"

@interface BusScheduleViewController ()

@end

@implementation BusScheduleViewController

@synthesize warningLabel;
NSArray *buses;
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
    self.title = @"Bus Schedule";
    warningLabel.text = @"WARNING: Times marked with X are not running during finals week.";
    buses = [[NSArray alloc] initWithObjects:
             @"108-Adelphi",
             @"125-Circulator",
             @"104-College Park Metro",
             @"105-Courtyards Express",
             @"128-Enclave",
             @"131-Enclave Mazza Grandmarc",
             @"129-Franklin Park",
             @"130-Greenbelt",
             @"113-Hyattsville",
             @"133-Mall at PG",
             @"127-Mazza Grandmarc",
             @"109-River Road",
             @"110-Silver Springs apt",
             @"111-Silver Springs",
             @"132-Varsity",
             @"117-Blue",
             @"118-Gold",
             @"122-Green",
             @"115-Orange",
             @"116-Purple",
             nil
             ];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [buses count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableId = @"buses";
    UITableViewCell *current_cell = [tableView dequeueReusableCellWithIdentifier:simpleTableId];
    if(current_cell == nil){
        current_cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableId];
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            current_cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    current_cell.textLabel.text = [buses objectAtIndex:indexPath.row];
    return current_cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusViewController *controller = [[BusViewController alloc] initWithNibName:@"BusViewController" bundle:[NSBundle mainBundle]];
    //switch here
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end