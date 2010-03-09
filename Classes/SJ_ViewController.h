//
//  SJ_ViewController.h
//  CustomNavCtrl
//
//  Created by MfinoMBP on 09/03/10.
//  Copyright 2010 mFino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJ_NavigationController.h"

@interface SJ_ViewController : UIViewController {

	SJ_NavigationController *sjNavigationController;
	UINavigationItem *sjNavigationItem;
}
@property (nonatomic, retain) SJ_NavigationController *sjNavigationController;
@property (nonatomic, retain, readonly) UINavigationItem *sjNavigationItem;

@end
