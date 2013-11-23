//
//  SelectedLibraryViewController.h
//  FAP
//
//  Created by Kieran Raftery on 11/23/13.
//  Copyright (c) 2013 Mobile App Developers Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectedLibraryViewController : UIViewController

@property(nonatomic, strong) IBOutlet UILabel *label;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;
@property(nonatomic, strong) IBOutlet UITextView *textView;
@property(nonatomic, strong) NSString *labelText;
@property(nonatomic, strong) NSString *imageName;
@property(nonatomic, strong) NSString *textViewText;

@end
