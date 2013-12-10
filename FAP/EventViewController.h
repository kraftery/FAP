//
//  EventViewController.h
//  FAP
//
//  Created by Kieran Raftery on 12/10/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController

@property(nonatomic, strong) IBOutlet UILabel *label;
@property(nonatomic, strong) IBOutlet UITextView *textView;
@property(nonatomic, strong) NSString *labelText;
@property(nonatomic, strong) NSString *textViewText;

@end
