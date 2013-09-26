//
//  PIWindowController.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "PIWindowController.h"

@interface PIWindowController ()

@end

@implementation PIWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        command = [[CommandLine alloc] init];
        manager = [[ProvisioningManager alloc] init];
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (IBAction)remove:(id)sender {
}

- (IBAction)refresh:(id)sender {
}

- (IBAction)add:(id)sender {
    NSRange range;
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO];
   /// [panel setAllowedFileTypes:[NSArray arrayWithObject:@"/////xml"]];
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSOKButton) {
        NSString * url = [[NSString alloc]initWithFormat:@"%@",[panel URL]];
        range = [url rangeOfString:@"file://localhost"];
        if (range.length != 0){
            url = [url stringByReplacingOccurrencesOfString:@"file://localhost" withString:@""];
            NSArray *list =  [manager getProvisioningModelByFilePath:url];
        }
    
    }
}
    

@end
