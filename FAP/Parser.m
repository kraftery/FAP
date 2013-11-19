//
//  Parser.m
//  FAP
//
//  Created by Libraries on 11/18/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import "Parser.h"
//This class converts json to NSDictionary which is the same as a hash in other
//programming langs.
@implementation Parser

/*-(Parser *) initWithClass: (NSString *) className{
    self = [super init];
    if(self){
        []
    }
}*/

//This method validates the input given to us by the user
-(int) validateInput: (NSString *) class{
    if([class length] == 0){//if nothing was put in the text field
        return 0;
    }
    else if([class length] > 0 && [self classExists:class] == false){
        // so if there's a string but the class doesnt exist or something
        return -1;
    }
    return 1; //if it's actually correct
}

//checks the DB to see if the class exists
-(BOOL) classExists: (NSString *) class{
    //We'll check our database and see if the class exists
    return false;
}

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
-(NSArray) parse{

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
}

@end
