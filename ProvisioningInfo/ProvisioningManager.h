//
//  ProvisioningManager.h
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProvisioningModel.h"
#import "CommandLine.h"

@interface ProvisioningManager : NSObject{
    CommandLine *command;
	NSMutableArray *provisioningList;
}

-(NSArray*)getProvisioningModelByFilePath:(NSString*)filePath;
@property (strong) NSMutableArray *provisioningList;

@end
