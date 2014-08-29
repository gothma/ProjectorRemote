//
//  PRAppDelegate.m
//  ProjectorRemote
//
//  Created by Martin Goth on 30.08.13.
//  Copyright (c) 2013 Martin Goth. All rights reserved.
//

#import "PRAppDelegate.h"
#import "PRProjector.h"
#import "PRSettingsWindowController.h"
#import "Reachability.h"

@implementation PRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.projector = [PRProjector projectorWithURLString:@"http://epson6.informatik.privat"];
	for (NSString* source in self.projector.sources.allKeys) {
		NSMenuItem* item = [[NSMenuItem alloc] initWithTitle:source action:@selector(switchSource:) keyEquivalent:@""];
		[self.sourceMenu addItem:item];
	}
	
//	Reachability* reachability = [Reachability reachabilityWithHostname:self.projector.projectorURL];
//	
//	reachability.reachableBlock = ^(Reachability*reach) {
//		[self toggleStatusIconWithVisibility:YES];
//	};
//	
//	reachability.unreachableBlock = ^(Reachability*reach) {
//		[self toggleStatusIconWithVisibility:NO];
//	};
//	
//	[reachability startNotifier];
//	
//	NSLog(@"The projector is %c", reachability.isReachable);
//	
//	self.winCon = [PRSettingsWindowController new];

}

- (void)toggleStatusIconWithVisibility:(bool)visibility {
	if (visibility) {
		self.statusItem = [NSStatusBar.systemStatusBar statusItemWithLength:NSSquareStatusItemLength];
		self.statusItem.menu = self.statusMenu;
		NSImage *image = [NSImage imageNamed:@"proj"];
		[image setTemplate:YES];
		self.statusItem.image = image;
		//self.statusItem.alternateImage = [NSImage imageNamed:@"projalt"];
		//self.statusItem.highlightMode = YES;
	} else {
		[NSStatusBar.systemStatusBar removeStatusItem:self.statusItem];
	}
}

- (void)awakeFromNib {
	[self toggleStatusIconWithVisibility:YES];
}



- (IBAction)turnOnOff:(id)sender {
	[self.projector sendCommand:@"OnOff"];
}

- (IBAction)mute:(id)sender {
	[self.projector sendCommand:@"Mute"];
}

- (IBAction)freeze:(id)sender {
	[self.projector sendCommand:@"Freeze"];
}

- (void)switchSource:(NSMenuItem *)sender {
	[self.projector switchToSource:sender.title];
}

- (IBAction)showSettings:(id)sender {
	[self.winCon showWindow:sender];
}

- (IBAction)exitApplication:(id)sender {
	[[NSApplication sharedApplication] terminate:nil];
}





@end
