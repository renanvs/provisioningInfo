//
//  ProvisioningCellView.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/11/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "ProvisioningCellView.h"

@implementation ProvisioningCellView
@synthesize AppIDName,ApplicationIdentifier,CreationData,ExpirationDate,TeamName,TeamIdentifier,Name;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
    
    AppIDName.stringValue = model.AppIDName;
    ApplicationIdentifier.stringValue = model.ApplicationIdentifier;
    CreationData.stringValue = model.CreationData;
    ExpirationDate.stringValue = model.ExpirationDate;
    TeamIdentifier.stringValue = model.TeamIdentifier;
    TeamName.stringValue = model.TeamName;
    Name.stringValue = model.Name;
    
}

-(void)setModel:(ProvisioningModel*)modelR{
    model = modelR;
}



@end
