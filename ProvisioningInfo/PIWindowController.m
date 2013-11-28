//
//  PIWindowController.m
//  ProvisioningInfo
//
//  Created by renan veloso silva on 25/09/13.
//  Copyright (c) 2013 renan veloso silva. All rights reserved.
//

#import "PIWindowController.h"
#import "ProvisioningModel.h"
#import "ProvisioningCellView.h"

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
    NSButton *bt = [[NSButton alloc] initWithFrame:NSRectFromCGRect(CGRectMake(0, 0, 50, 50))];
    [bt setTitle:@"teste"];
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
            NSLog(@"log");
        }
    
    }
}
    
-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [manager provisioningList].count;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    ProvisioningModel *model = [manager.provisioningList objectAtIndex:row];
    NSString *identifier = @"MainCell";
    
    if ([[tableColumn identifier] isEqualToString:identifier]) {
        ProvisioningCellView *cell = (ProvisioningCellView*)[tableView makeViewWithIdentifier:identifier owner:self];
        [model retain];
        [cell setModel:model];
        return cell;
    }
    
    return nil;
    
    
}



@end
