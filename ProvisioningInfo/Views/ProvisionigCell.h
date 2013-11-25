//
//  ProvisionigCell.h
//  ProvisioningInfo
//
//  Created by renan veloso silva on 24/11/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ProvisioningModel.h"

@interface ProvisionigCell : NSTableCellView{
    ProvisioningModel *provisioningModel;
}

@property (retain, nonatomic) IBOutlet NSTextField *name;

@property (retain, nonatomic) IBOutlet NSTextField *creationData;
@property (retain, nonatomic) IBOutlet NSTextField *applicationIdentifier;

@property (retain, nonatomic) IBOutlet NSTextField *teamIdentifier;
@property (retain, nonatomic) IBOutlet NSTextField *teamName;

- (void) setModel : (ProvisioningModel*)modelR;

@end
