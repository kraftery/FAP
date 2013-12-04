//
//  MyScheduleViewController.m
//  FAP
//
//  Created by Kieran Raftery on 11/2/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "MyScheduleViewController.h"

@interface MyScheduleViewController ()

@end

@implementation MyScheduleViewController

@synthesize tableView;

-(IBAction)addButtonClick:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Add A Class"
                                                    message:@"Enter a class to get its exam time"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Save", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [[alert textFieldAtIndex:1] setSecureTextEntry:NO];
    [[alert textFieldAtIndex:0] setPlaceholder:@"Class Name"];
    [[alert textFieldAtIndex:1] setPlaceholder:@"Section Number"];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex != [alertView cancelButtonIndex]) {
        NSString *className = [([[alertView textFieldAtIndex:0] text]) stringByReplacingOccurrencesOfString:@" " withString:@""];
        NSString *sectionNumber = [([[alertView textFieldAtIndex:1] text]) stringByReplacingOccurrencesOfString:@" " withString:@""]; //this gets rid of spaces in between the string
        NSString *expression = @"^[0-9]{4}$";
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression                                                                               options:NSRegularExpressionCaseInsensitive                                                                                 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:sectionNumber                                                         options:0 range:NSMakeRange(0, [sectionNumber length])];
        if (numberOfMatches == 0){
            UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"That is not a valid section number, Try again." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
            [errorView show];
            return;
        }
        NSMutableArray *examInfo = [self parse:className second:sectionNumber];
        if (examInfo != nil) {
            [myExams addObject:examInfo];
        }
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *exams = [[NSArray alloc] initWithArray:myExams];
        [defaults setObject:exams forKey:@"exams"];
        [defaults synchronize];
        [tableView reloadData];
    }
}



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
    
    self.title = @"My Schedule";
    
    myExams = [[NSMutableArray alloc] init];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *exams = [defaults objectForKey:@"exams"];
    for (NSString *s in exams) {
        [myExams addObject:s];
    }
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                  style:UIBarButtonItemStyleBordered target:self
                                                                 action:@selector(addButtonClick:)];
    [self.navigationItem setRightBarButtonItem:addButton];
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
    return [myExams count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *exam = [myExams objectAtIndex:indexPath.row];
    NSString *timeDay = [[NSString alloc] initWithFormat:@"%@ %@", [exam objectAtIndex:1], [exam objectAtIndex:2]];
    NSString *header = [[NSString alloc] initWithFormat:@"%@ - %@", [[exam objectAtIndex:0] uppercaseString], [exam objectAtIndex:3]];
    cell.textLabel.text = header;
    cell.detailTextLabel.text = timeDay;
    
    return cell;
}

// Override to allow swipe to delete method
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [myExams removeObject:[myExams objectAtIndex:indexPath.row]];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *exams = [[NSArray alloc] initWithArray:myExams];
        [defaults setObject:exams forKey:@"exams"];
        [defaults synchronize];
        [tableView reloadData];
    }
}

#pragma mark-
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// I JUST UPLOADED THIS PART. SINCE I CANT COMPILE IT'S PROB GONNA HAVE ERRORS SO PLEASE CHECK AND FIX
//This method validates the input given to us by the user
-(int) validateInput: (NSString *) class{
    if([class length] == 0 || class == nil){//if nothing was put in the text field
        return 0;
    }
    return 1;
}


-(NSMutableArray *) parse: (NSString *) className second: (NSString *) sectionNumber{
    NSMutableArray *final;
    NSMutableArray *to_return;
    if(className == nil || [className length] == 0 || sectionNumber == nil || [sectionNumber length] == 0){
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error"                                                            message:@"There was an error getting your class. Please try again later."                                                           delegate:self                                                  cancelButtonTitle:@"Dismiss"                                                  otherButtonTitles:nil, nil];
        errorView.alertViewStyle = UIAlertViewStyleDefault;
        [errorView show];
        return nil;
    }
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://mobileappdevelopersclub.com/shellp/ShelLp_Final/%@/", className];
    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:urlString]];
    
    NSString *section, *day, *time, *location, *instructor;
    
    NSError *error = nil;
    //this is an array of dictionaries aka hashes
    NSMutableArray *classArray = [NSJSONSerialization
                           JSONObjectWithData: jsonFile
                           options: NSJSONReadingMutableContainers
                           error: &error
                           ];
    
    if(error){
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error getting your class.Please try again later" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return nil;
    }
    else{
        if(classArray == nil || [classArray count] == 0){
            UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The class is not a wrong or is not offered this semester" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
            [errorView show];
            return nil;
        }
        else{
        //we will return a 2D arrray
        final = [[NSMutableArray alloc] init]; //this will contain arrays as in it's indexes => it's gonna be a 2d array
        for (NSDictionary *dictionary in classArray){
            section = [dictionary objectForKey:@"section"];
            day = [dictionary objectForKey:@"day"];
            time = [dictionary objectForKey:@"time"];
            location = [dictionary objectForKey:@"location"];
            instructor = [dictionary objectForKey:@"instructor"];
            
            //Put all the above strings in an array
            NSArray *final_object = [[NSArray alloc] initWithObjects:section, day, time, location, instructor, nil];
            [final addObject:final_object];
            
        } //end for loop
        } //end else
    }
    //preparing string to return
    for (NSArray *current_class in final) {
        if([sectionNumber isEqualToString:[current_class objectAtIndex:0]]){
            //to_return = [NSString stringWithFormat:@"%@\n%@\n%@ %@", className, day, time, location];
            to_return = [[NSMutableArray alloc] initWithObjects:className, day, time, location, nil];
            break;
        }
    }
    if(to_return == nil || [to_return count] == 0){
        UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"The class or section number you entered is wrong" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [errorView show];
        return nil;
    }
    return to_return;
}

@end
