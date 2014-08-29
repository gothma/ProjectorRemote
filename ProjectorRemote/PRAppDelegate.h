//
//  PRAppDelegate.h
//  ProjectorRemote
//
//  Created by Martin Goth on 30.08.13.
//  Copyright (c) 2013 Martin Goth. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class PRProjector;
@class Reachability;
@interface PRAppDelegate : NSObject <NSApplicationDelegate> {


}
@property NSWindowController* winCon;
@property PRProjector* projector;
- (IBAction)turnOnOff:(id)sender;
- (IBAction)mute:(id)sender;
- (IBAction)freeze:(id)sender;
- (IBAction)switchSource:(NSMenuItem*)sender;
- (IBAction)showSettings:(id)sender;
- (IBAction)exitApplication:(id)sender;
@property (weak) IBOutlet NSMenu *sourceMenu;
@property (weak) IBOutlet NSMenu *statusMenu;
@property NSStatusItem* statusItem;
@end

