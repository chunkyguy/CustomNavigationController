//
//  CustomNavCtrlAppDelegate.h
//  CustomNavCtrl
//
//  Created by Sidharth on 09/03/10.
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

