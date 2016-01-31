//
//  SpotlightManager.h
//  UIDemoApp
//
//  Created by Krati Jain on 30/01/16.
//  Copyright © 2016 flipkart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpotlightManager : NSObject

+ (instancetype) getSharedInstance;

-(void)indexAppDeepLinks;
-(void)indexSpotlightItemWithTitle:(NSString *)title andDescription:(NSString *)description andUniqueID:(NSString *)uniqueId andDomainID:(NSString *)domainID andThumbnailData:(NSData *)thumbnailData;
-(void)clearUserIndices;
@end
