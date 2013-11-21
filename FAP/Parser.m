//
//  Parser.m
//  FAP
//
//  Created by Libraries on 11/18/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "Parser.h"

@implementation Parser

/*This gets the json file and actually gets the fields from the class keys. THe json file should look like this
    "CMSC417" : [
        {
            "name" : "CMSC417"
            "Professor" : "Agrawala"
            "date" : "December 25"
            "start" : "2pm"
            "end" : "2am"
            "room" : "Hornbake 1234"
        }
*/

-(NSArray *) parse{

    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL:
                    [NSURL URLWithString:@"URL To Json here"]];// THis might be changed, we just need to get the json somehow.

    NSError *error = nil;
    NSArray *classArray = [NSJSONSerialization
                           JSONObjectWithData: jsonFile
                           options: nil
                           error: &error
                           ];

    if(error){
        return nil;
        /*
         UIAlertView *errorView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"PUT ERROR MESSAGE HERE" delegate:nil cancelButtonTitle:@"Dismiss" otherButonTitles:nil];
         [errorView show];
         */
        //NSLog(@"%@", [error localizedDescription]);
    }
    else{
        //I have to return the array here
        //NSString *session = [[classArray objectAtIndex:indexPath.row] objectForKey:@"session"]; //this is how we get the session data
    }
    
    return classArray;
}

@end
