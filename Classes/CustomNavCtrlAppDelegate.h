//
//  CustomNavCtrlAppDelegate.h
//  CustomNavCtrl
//
//  Created by MfinoMBP on 09/03/10.
//  Copyright mFino 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJ_NavigationController;
@interface CustomNavCtrlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SJ_NavigationController *navCtrl;
}

@property (nonatomic,retain) SJ_NavigationController *navCtrl;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

