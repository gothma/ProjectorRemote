//
//  PRSettingsWindowController.m
//  ProjectorRemote
//
//  Created by Martin Goth on 31.08.13.
//  Copyright (c) 2013 Martin Goth. All rights reserved.
//

#import "PRSettingsWindowController.h"

@interface PRSettingsWindowController ()

@end

@implementation PRSettingsWindowController

- (id)init
{
    self = [super initWithWindowNibName:@"PRSettingsWindowController"];
    if(self)
    {
        //initialize stuff
    }
    return self;
}

- (void)showWindow:(id)sender {
	[super showWindow:sender];
	[[self window] center];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
