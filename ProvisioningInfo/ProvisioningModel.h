//
//  ProvisioningModel.h
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvisioningModel : NSObject

@property (weak) NSString *AppIDName;
@property (weak) NSString *CreationData;
@property (weak) NSString *DeveloperCertificates;

@property (weak) NSString *ApplicationIdentifier;
@property (weak) NSString *ExpirationDate;
@property (weak) NSString *Name;

@property (weak) NSArray *ProvisiongDevices;
@property (weak) NSString *TeamIdentifier;
@property (weak) NSString *TeamName;
@property (weak) NSString *Version;

@property (weak) NSString *Folder;

@end
