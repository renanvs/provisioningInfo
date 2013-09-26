//
//  Created by renan veloso silva on 03/08/13.
//
//
/*
 Essa classe tem como objetivo apenas execultar comando de prompt
 */

#import "CommandLine.h"

@implementation CommandLine
@synthesize currentDirectoryPath;

-(void)taskLaunchCommand:(NSString *)commandLine{
    [self taskLaunchCommandWithResponse:commandLine];
}

-(NSString*)taskLaunchCommandWithResponse:(NSString *)commandLine{
    NSArray *obj = [NSArray arrayWithObjects:@"-c", commandLine, nil];
    NSTask * task = [[NSTask alloc]init];
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:obj];
	
    if (!currentDirectoryPath || [currentDirectoryPath isEqualToString:@""]) {
    		currentDirectoryPath = @"/";
    }
	
    [task setCurrentDirectoryPath:[NSString stringWithString:[currentDirectoryPath stringByExpandingTildeInPath]]];
    [task setEnvironment:[NSDictionary dictionaryWithObject:@"/Applications/Xcode.app/Contents/Developer/usr/bin/codesign_allocate" forKey:@"CODESIGN_ALLOCATE"]];
    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];
    [task setStandardError:pipe];
    
    NSFileHandle *file;
    file = [pipe fileHandleForReading];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *output;
    output = [[NSString alloc] initWithData: data
                                   encoding: NSUTF8StringEncoding];
    
	[task waitUntilExit];
    
    int status = task.terminationStatus;
    
    //se tiver algum erro e o log estiver ativo o erro é adicionando ao log
	if (status != 0) {
        NSString * currentErro = [[NSString alloc]initWithFormat:@"In command: %@\nError number: %i\nResponse: %@\n", commandLine, task.terminationStatus, output];
    }
	
    return output;
}



@end
