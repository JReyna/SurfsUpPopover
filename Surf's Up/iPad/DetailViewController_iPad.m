//
//  DetailViewController_iPad.m
//  Surf's Up
//
//  Created by Steven Baranski on 9/17/11.
//  Copyright 2011 Razeware LLC. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
#import "AboutBackgroundView.h"
#import "DetailViewController_iPad.h"
#import "AboutViewController.h"

@implementation DetailViewController_iPad

@synthesize detailPopover;
@synthesize aboutPopover;
@synthesize lastTappedButton;

#pragma mark - Private behavior

- (void)showAboutPopover
{
	if ([[self aboutPopover] isPopoverVisible] == NO) 
    {
		[[self aboutPopover] presentPopoverFromBarButtonItem:self.lastTappedButton 
                               permittedArrowDirections:UIPopoverArrowDirectionAny 
                                               animated:YES];		
	}
	else 
    {
		[[self aboutPopover] dismissPopoverAnimated:YES];
	}    
}

#pragma mark - IBActions

- (IBAction)aboutTapped:(id)sender
{
    [self setLastTappedButton:sender];
    [self showAboutPopover];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_sand"]]];
    [rentSwitch setOnTintColor:[UIColor colorWithRed:0 green:175.0/255.0 blue:176.0/255.0 alpha:1.0]];
    
    // About button
    
    UIBarButtonItem *aboutButton = [[UIBarButtonItem alloc] initWithTitle:@"About"
                                                                    style:UIBarButtonItemStylePlain
                                                                   target:self 
                                                                   action:@selector(aboutTapped:)];    
    [self.navigationItem setRightBarButtonItem:aboutButton animated:YES]; 
    
    // Initialize popover
    
    AboutViewController *aboutVC = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:nil];
    [self setAboutPopover:[[UIPopoverController alloc] initWithContentViewController:aboutVC]];
    [[self aboutPopover] setDelegate:self];
    
    [[self aboutPopover] setPopoverBackgroundViewClass:[AboutBackgroundView class]];
}

#pragma mark - UISplitViewControllerDelegate

- (void)splitViewController:(UISplitViewController*)svc 
     willHideViewController:(UIViewController *)aViewController 
          withBarButtonItem:(UIBarButtonItem*)barButtonItem 
       forPopoverController:(UIPopoverController*)pc 
{    
    barButtonItem.title = @"Surf Trips";
    [[self navigationItem] setLeftBarButtonItem:barButtonItem animated:YES];
    [self setDetailPopover:pc];
}

- (void)splitViewController: (UISplitViewController*)svc 
     willShowViewController:(UIViewController *)aViewController 
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem 
{    
    [[self navigationItem] setLeftBarButtonItem:nil animated:YES];
    self.detailPopover = nil;
}

- (void)splitViewController:(UISplitViewController*)svc popoverController:(UIPopoverController*)pc willPresentViewController:(UIViewController *)aViewController 
{
	if ([[self aboutPopover] isPopoverVisible]) 
    {
        [[self aboutPopover] dismissPopoverAnimated:YES];
    } 
}

#pragma mark - UIPopoverViewControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController 
{
	self.lastTappedButton = nil;
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration 
{
	if ([self aboutPopover] != nil) 
    {
		[[self aboutPopover] dismissPopoverAnimated:YES];
	}
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation 
{
    if (self.lastTappedButton != nil) 
    {
		[self showAboutPopover];
	}
}

@end
