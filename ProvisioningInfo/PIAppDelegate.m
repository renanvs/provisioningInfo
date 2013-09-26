//
//  PIAppDelegate.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "PIAppDelegate.h"


@implementation PIAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    windowController = [[PIWindowController alloc] initWithWindowNibName:@"PIWindowController"];
    [windowController showWindow:self];
}

@end
