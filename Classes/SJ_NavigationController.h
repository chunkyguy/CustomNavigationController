//
//  SJ_NavigationController.h
//  CustomNavCtrl
//
//  Created by MfinoMBP on 09/03/10.
//  Copyright 2010 mFino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SJ_ViewController;
@interface SJ_NavigationController : UIViewController {

	NSMutableArray *controllers;
	UINavigationBar *navBar;
	//int ctrlIndx;
	UIView *containerVw;
	SJ_ViewController *topmostSJCtrl;
	BOOL hidden;
}

@property (nonatomic, retain) UINavigationBar *navBar;
@property (nonatomic,retain) UIView *containerVw;
@property (nonatomic, retain) SJ_ViewController *topmostSJCtrl;
@property (nonatomic, assign) BOOL hidden;

-(id)initWithRootSJController:(SJ_ViewController *)rootVwCtrl;
-(SJ_ViewController *)loadTopView;
-(void)_pushSJController:(SJ_ViewController *)aCtrl;
-(SJ_ViewController *)_topSJController;
-(void)_popSJController;
- (void)pushSJController:(UIViewController *)viewController animated:(BOOL)animated;
-(void)pushNavItemForSJCtrl:(SJ_ViewController *)ctrl  animated:(BOOL)animie;
- (SJ_ViewController *)popSJControllerAnimated:(BOOL)animated;
- (NSArray *)popToRootSJControllerAnimated:(BOOL)animated;
@end
