//
//  ProvisioningCellView.h
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/11/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ProvisioningModel.h"

@interface ProvisioningCellView : NSTableCellView{
    ProvisioningModel *model;
}

@property (assign) IBOutlet NSTextField *AppIDName;

@property (assign) IBOutlet NSTextField *CreationData;
@property (assign) IBOutlet NSTextField *ExpirationDate;

@property (assign) IBOutlet NSTextField *ApplicationIdentifier;
@property (assign) IBOutlet NSTextField *TeamIdentifier;

@property (assign) IBOutlet NSTextField *Name;
@property (assign) IBOutlet NSTextField *TeamName;


-(void)setModel:(ProvisioningModel*)modelR;


@end
