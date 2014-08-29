//
//  PRProjector.h
//  ProjectorRemote
//
//  Created by Martin Goth on 30.08.13.
//  Copyright (c) 2013 Martin Goth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRProjector : NSObject {
}
@property NSString* projectorURL;
@property NSDictionary* commands;
@property NSDictionary* sources;


- (void)switchToSource:(NSString *) source;
+ (id)projectorWithURLString:(NSString*) projector;
- (id)initWithURLString:(NSString *)projector;
- (void) sendCommand:(NSString *) string;

@end
