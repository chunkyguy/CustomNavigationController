//
//  SJ_NavigationController.m
//  CustomNavCtrl
//
//  Created by Sidharth on 09/03/10.
//

#import "SJ_NavigationController.h"
#import "SJ_ViewController.h"


@implementation SJ_NavigationController

@synthesize navBar;
@synthesize containerVw;
@synthesize topmostSJCtrl;
@synthesize hidden;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		controllers = [[NSMutableArray alloc] init];
		//ctrlIndx = -1;
    }
    return self;
}

-(id)initWithRootSJController:(SJ_ViewController *)rootVwCtrl
{
	if(self = [super initWithNibName:nil bundle:nil])
	{
		controllers = [[NSMutableArray alloc] init];
		self.topmostSJCtrl = rootVwCtrl;
	}	
	return self;
}

-(SJ_ViewController *)_topSJController
{
	return [controllers lastObject];
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	
	UIView *ctrlVw = [[UIView alloc] initWithFrame:CGRectMake(0,[[UIApplication sharedApplication]isStatusBarHidden]?80:60,320,400)];
	self.containerVw = ctrlVw;
	[ctrlVw setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	
	[self.view addSubview:ctrlVw];
	[ctrlVw release];
	UIImageView *aImgVw = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
	[aImgVw setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:aImgVw];
	[aImgVw release];
	
	UINavigationBar *aNavBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 40, 320, 44)];
	[aNavBar setDelegate:self];
	[self.view addSubview:aNavBar];
	self.navBar = aNavBar;
	[aNavBar release];
	
	hidden = NO;
	

	
	//[self loadTopView];
	if(self.topmostSJCtrl)
		[self pushSJController:topmostSJCtrl animated:NO];
}

-(SJ_ViewController *)loadTopView
{
	NSLog(@"loadTopView: %@",controllers);
	
	SJ_ViewController *topCtrl;
	if(topCtrl = [self _topSJController])
	{	
		//[self setContainerVw:topCtrl.view];
		[self.containerVw addSubview:topCtrl.view];
		//[self pushNavItemForSJCtrl:topCtrl];
	}	
	return topCtrl;
}

-(void)backItemAction
{
	SJ_ViewController *sj = [self popSJControllerAnimated:YES];
	NSLog(@"sj: %@",sj);
}

#pragma mark -
#pragma mark POP
- (NSArray *)popToRootSJControllerAnimated:(BOOL)animated
{
	NSMutableArray *popppedSJCtrls = [[NSMutableArray alloc] init];
	//SJ_ViewController *poppdCtrl;
		while([controllers count] > 1)
			[popppedSJCtrls addObject:[self popSJControllerAnimated:NO]];
	return [popppedSJCtrls autorelease];
}

- (SJ_ViewController *)popSJControllerAnimated:(BOOL)animated
{
	NSLog(@"popSJControllerAnimated >>");
	[self.navBar popNavigationItemAnimated:animated];
//	[self _popSJController];
	NSLog(@"popSJControllerAnimated <<");
	return [self _topSJController];
	
	//return [self loadTopView];
}

-(void)_popSJController
{
	if([self _topSJController])
		[controllers removeLastObject];
}

#pragma mark -
#pragma mark PUSH
- (void)pushSJController:(SJ_ViewController *)viewController animated:(BOOL)animated
{
	[self _pushSJController:viewController];
	[self pushNavItemForSJCtrl:viewController animated:animated];
	[self loadTopView];
}

-(UINavigationItem *)createNavigationItemForCtrl:(SJ_ViewController *)ctrl
{
	UINavigationItem *aNavItem = [ctrl sjNavigationItem];
	[aNavItem setTitle:[ctrl title]];
//	UINavigationItem *aNavItem = [[UINavigationItem alloc] initWithTitle:[ctrl title]];
	if([controllers count] > 1)
	{		
		if(!aNavItem.leftBarButtonItem)
		{
			UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backItemAction)];
			[aNavItem setBackBarButtonItem:backBtn];
			[backBtn release];
		}	
	}
	return aNavItem;
}

-(void)pushNavItemForSJCtrl:(SJ_ViewController *)ctrl animated:(BOOL)animie
{
	[self.navBar pushNavigationItem:[self createNavigationItemForCtrl:ctrl] animated:animie];
}

-(void)_pushSJController:(SJ_ViewController *)aCtrl
{
	[aCtrl setSjNavigationController:self];
	[controllers addObject:aCtrl];
}

-(void)setNavigationBarHidden:(BOOL)hide
{
	if(hide && !hidden)
	{	
		[self.containerVw setFrame:CGRectMake(0,-20,320,400)];
		[self.view bringSubviewToFront:self.containerVw];
		hidden = YES;
	}	
	else if(hidden)
	{	
		[self.containerVw setFrame:CGRectMake(0,[[UIApplication sharedApplication]isStatusBarHidden]?80:60,320,400)];
		[self.view sendSubviewToBack:self.containerVw];
		hidden = NO;
	}
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[controllers release];
    [super dealloc];
}

#pragma mark -
#pragma mark UINavigationBar methods
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item
{
	NSLog(@"shouldPopItem");
	[self _popSJController];
	[self loadTopView];
	return YES;
}

- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item
{
	NSLog(@"didPopItem");
	//[self _popSJController];
}

@end
