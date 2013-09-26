//
//  CommandLine.h
//  ReSignApplication
//
//  Created by renan veloso silva on 03/08/13.
//
//

#import <Foundation/Foundation.h>

@interface CommandLine : NSObject{
    NSString *currentDirectoryPath;
}

-(NSString*)taskLaunchCommandWithResponse:(NSString *)commandLine;

-(void)taskLaunchCommand:(NSString *)commandLine;

@property (assign) NSString *currentDirectoryPath;

@end
