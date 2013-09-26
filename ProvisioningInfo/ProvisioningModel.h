//
//  ProvisioningModel.h
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvisioningModel : NSObject

@property (assign) NSString *AppIDName;
@property (assign) NSString *CreationData;

@property (assign) NSString *ApplicationIdentifier;
@property (assign) NSString *ExpirationDate;
@property (assign) NSString *Name;

@property (assign) NSArray *ProvisiongDevices;
@property (assign) NSString *TeamIdentifier;
@property (assign) NSString *TeamName;
@property (assign) NSString *Version;

@property (assign) NSString *Path;

@end
