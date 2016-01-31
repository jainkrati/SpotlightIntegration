//
//  SpotlightManager.m
//  UIDemoApp
//
//  Created by Krati Jain on 30/01/16.
//  Copyright © 2016 flipkart. All rights reserved.
//

#import "SpotlightManager.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "SpotlightConstants.h"
#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "MenuViewController.h"

static SpotlightManager *sharedInstance;

@interface SpotlightManager(){
    //Deeplinking Manager
}

@end

@implementation SpotlightManager

+ (instancetype) getSharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SpotlightManager alloc] init];
    });
    return sharedInstance;
}

- (id) init {
    if(self = [super init]) {
        //listen to notifications
    }
    return self;
}

//Index the app deeplinks for Cart,Orders and Wishlist using Spotlight Search
-(void)indexAppDeepLinks{
    
    //index wishlist deeplink
    [self indexSpotlightItemWithTitle:@"What you do makes you different" andDescription:@"Tap to view Home Screen" andUniqueID:CS_SCREEN_1_INDEX_ID andDomainID:CS_DOMAIN_ID andThumbnailData:[NSData dataWithData:UIImagePNGRepresentation([UIImage imageNamed:@"image1.jpg"])]];
    
    //index cart deeplink
    [self indexSpotlightItemWithTitle:@"Dont wish. Do!!" andDescription:@"Tap to view second screen" andUniqueID:CS_SCREEN_2_INDEX_ID andDomainID:CS_DOMAIN_ID andThumbnailData:UIImagePNGRepresentation([UIImage imageNamed:@"image2.jpg"])];

    
}

//this method prepares the attributes based on parameters passed and creates an index for spotlight search
-(void)indexSpotlightItemWithTitle:(NSString *)title andDescription:(NSString *)description andUniqueID:(NSString *)uniqueId andDomainID:(NSString *)domainID andThumbnailData:(NSData *)thumbnailData{

    
    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString *)kUTTypeImage];
    attributeSet.title=title;
    attributeSet.contentDescription = description;
    
    if (thumbnailData!=nil) {
        attributeSet.thumbnailData = thumbnailData;
    }
    
    // Create a searchable item, specifying its ID, associated domain, and the attribute set you created earlier.
    CSSearchableItem *index = [[CSSearchableItem alloc] initWithUniqueIdentifier:uniqueId domainIdentifier:domainID attributeSet:attributeSet];
    
    //create index
    [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:@[index] completionHandler: nil];
    
}

//delete indices created for products visited and search terms
-(void)clearUserIndices{
    
    [[CSSearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:@[CS_DOMAIN_ID] completionHandler:nil];
}

@end
