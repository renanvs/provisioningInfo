//
//  ProvisionigCell.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 24/11/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "ProvisionigCell.h"

@implementation ProvisionigCell
@synthesize name, creationData, applicationIdentifier, teamName, teamIdentifier;


-(void)viewWillDraw{
    [name setStringValue:provisioningModel.Name];
    [creationData setStringValue:provisioningModel.CreationData];
    [applicationIdentifier setStringValue:provisioningModel.ApplicationIdentifier];
    [teamIdentifier setStringValue:provisioningModel.TeamIdentifier];
    [teamName setStringValue:provisioningModel.TeamName];
    
    
}

- (void) setModel : (ProvisioningModel*)modelR{
    provisioningModel = modelR;
    [provisioningModel retain];
}

@end
