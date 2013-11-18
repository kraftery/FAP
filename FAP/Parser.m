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
(int) validateInput: (NSString *) class{
    if([class length] == 0){//if nothing was put in the text field
        return 0;
    }
    else if([class length] > 0 && [class classExists] == false){
        // so if there's a string but the class doesnt exist or something
        return -1
    }
    return 1; //if it's actually correct
}

//checks the DB to see if the class exists
-(BOOL) classExists: (NSString *) class{
    //We'll check our database and see if the class exists
    return false
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
-(void) parse{

    NSData *jsonFile = [[NSData alloc] initWithContentsOfURL:
                    [NSURL URLWithString:@"URL To Json here"]];// THis might be changed, we just need to get the json somehow.

    NSError *error;
    NSDictionary *classHash = [NSJSONSerialization
                           JSONObjectWithData: jsonFile
                           options: NSJSONReadingMutableContainers
                           error: &error
                           ];

    if(error){
        NSLog(@"%@", [error localizedDescription]);
    }
    else{
        NSDictionary *current_class = classHash[@"WHATEVER KEY WE PUT FOR THE CLASS A PARTICULAR CLASS"];
            //this is a prototype of how we will get the fields
        (NSSting *) start_time = current_class[@"start"]; //assuming we have a field called start.
        (NSSting *) end_time = current_class[@"end"];
    }
}

@end
