//
//  HomeViewController.h
//  UIDemoApp
//
//  Created by Krati Jain on 30/10/14.
//  Copyright (c) 2014 flipkart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
- (IBAction)goToNextScreen:(id)sender;
- (IBAction)createIndices:(id)sender;
- (IBAction)deleteIndices:(id)sender;

@end
