//
//  CollapsableTableViewViewController.m
//  CollapsableTableView
//
//  Created by Bernhard Häussermann on 2011/03/29.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "CollapsableTableViewViewController.h"
#import "CollapsableTableView.h"


@implementation CollapsableTableViewViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CollapsableTableView* tableView = (CollapsableTableView*) myTableView;
    tableView.collapsableTableViewDelegate = self;
    
//    [tableView setIsCollapsed:YES forHeaderWithTitle:@"First Section"];
//    [tableView setIsCollapsed:YES forHeaderWithTitle:@"Second Section"];
//    [tableView setIsCollapsed:YES forHeaderWithTitle:@"Third Section"];
//    [tableView setIsCollapsed:YES forHeaderWithTitle:@"Fourth Section"];
//    [tableView setIsCollapsed:YES forHeaderWithTitle:@"Fifth Section"];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [spinner release];
    spinner = nil;
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [spinner release];
    [super dealloc];
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}


+ (NSString*) titleForHeaderForSection:(NSInteger) section
{
    switch (section)
    {
        case 0 : return @"First Section";
        case 1 : return @"Second Section";
        case 2 : return @"Third Section";
        case 3 : return @"Fourth Section";
        case 4 : return @"Fifth Section";
        default : return [NSString stringWithFormat:@"Section no. %li",section + 1];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [CollapsableTableViewViewController titleForHeaderForSection:section];
}

// Uncomment the following two methods to use custom header views.
//- (UILabel *) createHeaderLabel: (UITableView *) tableView :(NSString *)headerTitle {
//    UILabel *titleLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
//    titleLabel.frame =CGRectMake(0, 0, tableView.frame.size.width - 20, 60);
//    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:20];
//    titleLabel.text = headerTitle;
//    titleLabel.textAlignment = UITextAlignmentRight;
//    return titleLabel;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    // create the parent view that will hold header Label
//    UIView * customView = [[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, tableView.frame.size.width , 60)]autorelease];
//    UILabel *titleLabel;
//    titleLabel = [self createHeaderLabel: tableView :[CollapsableTableViewViewController titleForHeaderForSection:section]];
//    
//    [customView addSubview:titleLabel];
//    
//    UILabel* collapsedLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10,0,50,60)] autorelease];
//    collapsedLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//    collapsedLabel.backgroundColor = [UIColor clearColor];
//    collapsedLabel.textColor = [UIColor whiteColor];
//    collapsedLabel.text = @"-";
//    collapsedLabel.tag = COLLAPSED_INDICATOR_LABEL_TAG;
//    [customView addSubview:collapsedLabel];
//    
//    customView.tag = section;
//    customView.backgroundColor = [UIColor blackColor];
//    return customView;
//}

//- (NSString*) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"Footer %i",section + 1];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 2 : return 0;
        case 3 : return 30;
        default : return 8;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
    
    switch (indexPath.row)
    {
        case 0 : cell.textLabel.text = @"First Cell"; break;
        case 1 : cell.textLabel.text = @"Second Cell"; break;
        case 2 : cell.textLabel.text = @"Third Cell"; break;
        case 3 : cell.textLabel.text = @"Fourth Cell"; break;
        case 4 : cell.textLabel.text = @"Fifth Cell"; break;
        case 5 : cell.textLabel.text = @"Sixth Cell"; break;
        case 6 : cell.textLabel.text = @"Seventh Cell"; break;
        case 7 : cell.textLabel.text = @"Eighth Cell"; break;
        default : cell.textLabel.text = [NSString stringWithFormat:@"Cell %i",indexPath.row + 1];
    }
    
    //cell.detailTextLabel.text = ...;
    
    return cell;
}


#pragma mark -
#pragma mark CollapsableTableViewDelegate

- (void) collapsableTableView:(CollapsableTableView*) tableView willCollapseSection:(NSInteger) section title:(NSString*) sectionTitle headerView:(UIView*) headerView
{
    [spinner startAnimating];
}

- (void) collapsableTableView:(CollapsableTableView*) tableView didCollapseSection:(NSInteger) section title:(NSString*) sectionTitle headerView:(UIView*) headerView
{
    [spinner stopAnimating];
}

- (void) collapsableTableView:(CollapsableTableView*) tableView willExpandSection:(NSInteger) section title:(NSString*) sectionTitle headerView:(UIView*) headerView
{
    [spinner startAnimating];
}

- (void) collapsableTableView:(CollapsableTableView*) tableView didExpandSection:(NSInteger) section title:(NSString*) sectionTitle headerView:(UIView*) headerView
{
    [spinner stopAnimating];
}


#pragma mark -
#pragma mark IBAction methods

- (IBAction) toggleSection2
{
    NSString* sectionTitle = //[NSString stringWithFormat:@"Tag %i",1]; // Use this expression when using custom header views.
        [CollapsableTableViewViewController titleForHeaderForSection:1]; // Use this expression when specifying text for headers.
    CollapsableTableView* collapsableTableView = (CollapsableTableView*) myTableView;
    BOOL isCollapsed = [[collapsableTableView.headerTitleToIsCollapsedMap objectForKey:sectionTitle] boolValue];
    [collapsableTableView setIsCollapsed:! isCollapsed forHeaderWithTitle:sectionTitle];
}

@end
