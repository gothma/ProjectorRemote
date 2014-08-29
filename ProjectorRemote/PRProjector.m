//
//  PRProjector.m
//  ProjectorRemote
//
//  Created by Martin Goth on 30.08.13.
//  Copyright (c) 2013 Martin Goth. All rights reserved.
//

#import "PRProjector.h"

@implementation PRProjector

+ (id)projectorWithURLString:(NSString*) projector {
	return [[PRProjector alloc] initWithURLString:projector];
}
- (id)initWithURLString:(NSString *)projector {
	PRProjector* proj = [self init];
	proj.projectorURL = projector;
	proj.commands = @{
	@"OnOff": @"KEY=01",
	   @"Mute": @"KEY=3E",
	   @"Freeze": @"KEY=47",
	   @"Normal":@"LUMINANCE=00",
	   @"ECO": @"LUMINANCE=01"
	};
	
	proj.sources = @{
	  @"VGA":@"KEY=43",
	  @"LAN":@"KEY=8A",
	  @"HDMI":@"KEY=46"
   };
	
	return proj;
}

- (void) sendCommand:(NSString *)command{
	[self sendHTTPReq:self.commands[command]];
}

-(void)sendHTTPReq:(NSString *)getData {
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
	NSMutableString* finalurl = [NSMutableString stringWithString:self.projectorURL];
	[finalurl appendString:@"/cgi-bin/webconf.dll?"];
	[finalurl appendString:getData];
	
	request.URL = [NSURL URLWithString:finalurl];
	[request setValue:self.projectorURL forHTTPHeaderField:@"referer"];
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
	
    [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
	
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %li", finalurl, (long)[responseCode statusCode]);
    }
}

-(void)switchToSource:(NSString *)source {
	[self sendHTTPReq:self.sources[source]];
}


@end
