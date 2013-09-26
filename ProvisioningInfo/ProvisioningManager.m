//
//  ProvisioningManager.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "ProvisioningManager.h"

@implementation ProvisioningManager
@synthesize provisioningList;

-(id)init{
    self = [super init];
    
    if(self){
        command = [[CommandLine alloc] init];
        provisioningList = [[NSMutableArray alloc] initWithArray:[self getProvisioningSystemList]];
		
    }
    
    return self;
}

-(NSArray*)getProvisioningSystemList{
    NSString * provisionigSystemFilesResponde;
    NSMutableArray *list = [[NSMutableArray alloc] init];;
    
    NSString * provisionigSystemFolderResponde = [command taskLaunchCommandWithResponse:@"~/Library/MobileDevice/Provisioning\\ Profiles/"];
    NSRange existRange = [provisionigSystemFolderResponde rangeOfString:@"is a directory"];
    ///NSRange noExistRange = [provisionigSystemFolderResponde rangeOfString:@"No such file or directory"];
    
    
    if (existRange.length != 0) {
        provisionigSystemFilesResponde = [command taskLaunchCommandWithResponse:@"ls ~/Library/MobileDevice/Provisioning\\ Profiles/"];
    }else{
        return list;
    }
    
    NSMutableArray *provisionigNameList = [NSMutableArray arrayWithArray:[provisionigSystemFilesResponde componentsSeparatedByString:@"\n"]];
    [provisionigNameList removeLastObject];
    
    
    NSString *folderToLunchTask = @"~/Library/MobileDevice/Provisioning\\ Profiles/";
    for (NSString *provisioningFileName in provisionigNameList) {
        NSString *response = [command taskLaunchCommandWithResponse:[NSString stringWithFormat:@"security cms -D -i %@%@", folderToLunchTask, provisioningFileName]];
        [list addObject:[self getProvisioningModelByResponse:response AndFilePath:[NSString stringWithFormat:@"%@%@",folderToLunchTask, provisioningFileName]]];
    }
    
    return list;
}

-(ProvisioningModel*)getProvisioningModelByResponse:(NSString*)responseR AndFilePath:(NSString*)filePath{
    ProvisioningModel *model = [[ProvisioningModel alloc] init];
    
    NSData *data = [responseR dataUsingEncoding:NSUTF8StringEncoding];
		
	NSDictionary *propertiesDic = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:nil errorDescription:nil];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"dd/mm/yyyy"];
	
	model.AppIDName = [propertiesDic objectForKey:@"AppIDName"];
	model.CreationData = [formatter stringFromDate:[propertiesDic objectForKey:@"CreationDate"]];
	model.ApplicationIdentifier = [[propertiesDic objectForKey:@"ApplicationIdentifierPrefix"] objectAtIndex:0];
	model.ExpirationDate = [formatter stringFromDate:[propertiesDic objectForKey:@"ExpirationDate"]];
	model.Name = [propertiesDic objectForKey:@"Name"];
	model.ProvisiongDevices = [NSArray arrayWithArray:[propertiesDic objectForKey:@"ProvisionedDevices"]];
	model.TeamIdentifier = [[propertiesDic objectForKey:@"TeamIdentifier"] objectAtIndex:0];
	model.TeamName = [propertiesDic objectForKey:@"TeamName"];
	model.Version = [[propertiesDic objectForKey:@"Version"] stringValue];
	model.Path = filePath;
	
	return model;
}

-(NSArray*)getProvisioningModelByFilePath:(NSString*)filePath{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    NSString *response = [command taskLaunchCommandWithResponse:[NSString stringWithFormat:@"security cms -D -i %@", filePath]];
    [list addObject:[self getProvisioningModelByResponse:response AndFilePath:filePath]];
    
    
    return list;
}

@end
