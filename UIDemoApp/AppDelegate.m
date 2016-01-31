//
//  AppDelegate.m
//  UIDemoApp
//
//  Created by Krati Jain on 30/10/14.
//  Copyright (c) 2014 flipkart. All rights reserved.
//

#import "AppDelegate.h"
#import "SpotlightConstants.h"
#import "SpotlightManager.h"
#import "HomeViewController.h"
#import "MenuViewController.h"

#import <CoreSpotlight/CoreSpotlight.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    HomeViewController *mainviewcontroller = [storyBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    self.window.rootViewController = mainviewcontroller;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//handle the spotlight search item taps here
- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray * __nullable))restorationHandler{
    
    NSString *activityType = userActivity.activityType;
    
    if ([activityType isEqualToString:SPOTLIGHT_ACTIVITY_ID]) {
        
        NSString *uniqueItemId = [userActivity.userInfo objectForKey:CSSearchableItemActivityIdentifier];
        
        UIViewController *rootController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *targetVC = nil;
        
        if([uniqueItemId isEqualToString:CS_SCREEN_1_INDEX_ID]){
            
            targetVC = [storyBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
            
        }else if([uniqueItemId isEqualToString:CS_SCREEN_2_INDEX_ID]){
            
            targetVC = [storyBoard instantiateViewControllerWithIdentifier:@"MenuViewController"];
            
        }else{
            return NO;
        }
        
        [rootController.presentedViewController dismissViewControllerAnimated:NO completion:nil];
        [rootController presentViewController:targetVC animated:NO completion:nil];
        return YES;
        
    }
    return NO;
}
@end
