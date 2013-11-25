//
//  PIWindowController.h
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CommandLine.h"
#import "ProvisioningManager.h"

@interface PIWindowController : NSWindowController <NSTableViewDataSource, NSTableViewDelegate>{
    CommandLine *command;
    ProvisioningManager *manager;
}

- (IBAction)remove:(id)sender;
- (IBAction)refresh:(id)sender;
- (IBAction)add:(id)sender;

@property (assign) IBOutlet NSTableView *provisioningTableView;

@end
