//
//  RootNavCtrl.m
//  CustomNavCtrl
//
//  Created by Sidharth on 09/03/10.
//

#import "RootNavCtrl.h"
#import "SubNavCtrl.h"

@implementation RootNavCtrl


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"Root";

    }
    return self;
}



// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {

	[super loadView];
	[self.view setBackgroundColor:[UIColor redColor]];
	
	UIButton *subBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[subBtn setTitle:@"load next" forState:UIControlStateNormal];
	[subBtn addTarget:self action:@selector(loadSubVw) forControlEvents:UIControlEventTouchUpInside];
	[subBtn setFrame:CGRectMake(0, 100, 200, 30)];
	[self.view addSubview:subBtn];
	
	UIButton *popRoot = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[popRoot setTitle:@"pop to root" forState:UIControlStateNormal];
	[popRoot addTarget:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
	[popRoot setFrame:CGRectMake(0, 200, 200, 30)];
	[self.view addSubview:popRoot];
}

-(void)loadSubVw
{
	SubNavCtrl *subvwCtrl = [[SubNavCtrl alloc]initWithNibName:nil bundle:nil];
	[self.sjNavigationController pushSJController:subvwCtrl animated:YES];
	[subvwCtrl release];
}

-(void)popToRoot
{
	[self.sjNavigationController popToRootSJControllerAnimated:YES];
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
    [super dealloc];
}


@end
