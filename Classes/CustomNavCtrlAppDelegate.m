//
//  CustomNavCtrlAppDelegate.m
//  CustomNavCtrl
//
//  Created by Sidharth on 09/03/10.
//

#import "CustomNavCtrlAppDelegate.h"
#import "SJ_NavigationController.h"
#import "RootNavCtrl.h"

@implementation CustomNavCtrlAppDelegate

@synthesize window;
@synthesize navCtrl;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
	[window setBackgroundColor:[UIColor greenColor]];
	
	RootNavCtrl *rtCtrl = [[RootNavCtrl alloc] initWithNibName:nil bundle:nil];
	SJ_NavigationController *aNavCtrl = [[SJ_NavigationController alloc] initWithRootSJController:rtCtrl];
	[rtCtrl release];
	self.navCtrl = aNavCtrl;
	[window addSubview:[aNavCtrl view]];
	[aNavCtrl release];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
