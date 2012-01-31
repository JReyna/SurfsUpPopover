//
//  SurfsUpViewController_iPhone.m
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

#import "SurfsUpViewController_iPhone.h"

#import "DetailViewController_iPhone.h"
#import "PlaceholderViewController.h"

@implementation SurfsUpViewController_iPhone

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController_iPhone *vc1 = [[DetailViewController_iPhone alloc] initWithNibName:@"DetailView_iPhone" bundle:nil];
    [vc1 setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:100]];
    
    PlaceholderViewController *vc2 = [[PlaceholderViewController alloc] initWithNibName:@"PlaceholderView" bundle:nil];
    [vc2 setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:101]];
    
    PlaceholderViewController *vc3 = [[PlaceholderViewController alloc] initWithNibName:@"PlaceholderView" bundle:nil];
    [vc3 setTabBarItem:[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:102]];
    
    UITabBarController *tabController = [[UITabBarController alloc] init];     
    [tabController setViewControllers:[NSArray arrayWithObjects:vc1, vc2, vc3, nil]];
    [tabController setTitle:[self tripNameForRowAtIndexPath:indexPath]];     
    UIBarButtonItem *aboutButton = [[UIBarButtonItem alloc] initWithTitle:@"About"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self 
                                                                   action:nil];    
    [[tabController navigationItem] setRightBarButtonItem:aboutButton animated:YES];        
    
    [[self navigationController] pushViewController:tabController animated:YES];
}

@end
