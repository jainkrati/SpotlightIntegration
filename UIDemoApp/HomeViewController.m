//
//  HomeViewController.m
//  UIDemoApp
//
//  Created by Krati Jain on 30/10/14.
//  Copyright (c) 2014 flipkart. All rights reserved.
//

#import "HomeViewController.h"
#import "SpotlightManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goToNextScreen:(id)sender {
    [self performSegueWithIdentifier:@"menusegue" sender:self];
}

- (IBAction)createIndices:(id)sender {
    [[SpotlightManager getSharedInstance] indexAppDeepLinks];
}

- (IBAction)deleteIndices:(id)sender {
    [[SpotlightManager getSharedInstance] clearUserIndices];
}
@end
