//
//  ProvisioningManager.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "ProvisioningManager.h"

@implementation ProvisioningManager

-(id)init{
    self = [super init];
    
    if(self){
        command = [[CommandLine alloc] init];
        [self getProvisioningSystemList];
    }
    
    return self;
}

-(NSArray*)getProvisioningSystemList{
    NSString * provisionigSystemFilesResponde;
    NSMutableArray *list;
    
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
    
    //command.currentDirectoryPath = @"/Users/renansilva/Library/MobileDevice/Provisioning\\ Profiles/";
    //command.currentDirectoryPath = @"~/Library/MobileDevice/Provisioning\\ Profiles/";
    //[command taskLaunchCommand:@"cd ~/Library/MobileDevice/Provisioning\\ Profiles/"];
    
    NSString *folderToLunchTask = @"~/Library/MobileDevice/Provisioning\\ Profiles/";
    for (NSString *provisioningFileName in provisionigNameList) {
        NSString *response = [command taskLaunchCommandWithResponse:[NSString stringWithFormat:@"security cms -D -i %@%@", folderToLunchTask, provisioningFileName]];
        [list addObject:[self getProvisioningModelByResponse:response]];
    }
    
    return list;
}

-(ProvisioningModel*)getProvisioningModelByResponse:(NSString*)responseR{
    ProvisioningModel *model = [[ProvisioningModel alloc] init];
    
    NSArray *contents = [NSArray arrayWithContentsOfFile:responseR];
    
    return model;
}

-(NSArray*)getProvisioningModelByFilePath:(NSString*)filePath{
    NSMutableArray *list;
    
    NSString *response = [command taskLaunchCommandWithResponse:[NSString stringWithFormat:@"security cms -D -i %@", filePath]];
    [list addObject:[self getProvisioningModelByResponse:response]];
    
    
    return list;
}

@end
