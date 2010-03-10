//
//  SJ_ViewController.h
//  CustomNavCtrl
//
//  Created by Sidharth on 09/03/10.
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
