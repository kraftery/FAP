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
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if(buttonIndex != [alertView cancelButtonIndex]) {
        NSString *inputString = [[alertView textFieldAtIndex:0] text];
        [myExams addObject:[self getExamInfo:inputString]];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSArray *exams = [[NSArray alloc] initWithArray:myExams];
        [defaults setObject:exams forKey:@"exams"];
        [defaults synchronize];
        [tableView reloadData];
    }
}

//Take the class entered, send get request to get the class's exam info, return that info as NSString
-(NSString *)getExamInfo:(NSString *)className {
    
    return className;//until we know how to implement this method
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [myExams objectAtIndex:indexPath.row];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //has to be included, but it has no use currently
}

// I JUST UPLOADED THIS PART. SINCE I CANT COMPILE IT'S PROB GONNA HAVE ERRORS SO PLEASE CHECK AND FIX
//This method validates the input given to us by the user
-(int) validateInput: (NSString *) class{
    if([class length] == 0 || class == nil){//if nothing was put in the text field
        return 0;
    }
    return 1;
}


-(NSArray *) parse (NSString *) className{
    //WE DO THE CONNECTION HERE AND SEND THE STRING TO THE SERVER TO GET THE JSON FILE
    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL:
                        [NSURL URLWithString:@"URL To Json here"]];// THis might be changed, we just need to get the json somehow.
    
    NSError *error = nil;
    //this is an array of dictionaries aka hashes
    NSMutableArray *classArray = [NSJSONSerialization
                           JSONObjectWithData: jsonFile
                           options: NSJSONReadingMutableContainers
                           error: &error
                           ];
    
    if(error){
        return nil;
        //This code below pops up an error dialog box saying we couldnt get the file downloaded. when we call parse and it returns
        //nil, then we will use the code below to display an error
        
        /*
         UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"PUT ERROR MESSAGE HERE" delegate:nil cancelButtonTitle:@"Dismiss" otherButonTitles:nil];
         [errorView show];
         */
    }
    else{
        //we will return a 2D arrray
        NSMutableArray *final = [NSMutableArray alloc] init]; //this will contain arrays as in it's indexes => it's gonna be a 2d array
        for (NSDictionary *dictionary in classArray){
            NSString *section = [dictionary objectForKey:@"section"];
            NSString *day = [dictionary objectForKey:@"day"];
            NSString *time = [dictionary objectForKey:@"time"];
            NSString *location = [dictionary objectForKey:@"location"];
            NSString *instructor = [dictionary objectForKey:@"instructor"];
            
            //Put all the above strings in an array
            NSArray *final_object = [NSArray initWithObjects:section, day, time, location, instructor, nil];
            [final addObject:final_object];
            
        } //end for loop
    }
    
    return final;
}

@end
