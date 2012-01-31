//
//  SurfsUpAppDelegate_iPad.m
//  Surf's Up
//
//  Created by Steven Baranski on 9/16/11.
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

#import "SurfsUpAppDelegate_iPad.h"

#import "SurfsUpViewController_iPad.h"
#import "DetailViewController_iPad.h"

@implementation SurfsUpAppDelegate_iPad

- (void)customizeAppearance
{
    [super customizeAppearance];
    
    // UIToolbar

    UIImage *gradientTop = [[UIImage imageNamed:@"surf_gradient_textured_44"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UIToolbar appearance] setBackgroundImage:gradientTop 
                            forToolbarPosition:UIToolbarPositionTop
                                    barMetrics:UIBarMetricsDefault]; 
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Master
    
    SurfsUpViewController_iPad *masterVC = [[SurfsUpViewController_iPad alloc] initWithStyle:UITableViewStylePlain];
    [masterVC setTitle:@"Surf's Up"];
    [[masterVC navigationItem] setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title.png"]]];      
    UINavigationController *masterNavVC = [[UINavigationController alloc] initWithRootViewController:masterVC];
    
    // Detail
    
    DetailViewController_iPad *detailVC = [[DetailViewController_iPad alloc] initWithNibName:@"DetailView_iPad" bundle:nil];
    [masterVC setDetailVC:detailVC];
    UINavigationController *detailNavVC = [[UINavigationController alloc] initWithRootViewController:detailVC];
    
    // Assemble the split view
    
	UISplitViewController* splitVC = [[UISplitViewController alloc] init]; 
    [splitVC setViewControllers:[NSArray arrayWithObjects:masterNavVC, detailNavVC, nil]];    
    [splitVC setDelegate:detailVC];
	[[self window] setRootViewController:splitVC];
    [self setViewController:splitVC];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
