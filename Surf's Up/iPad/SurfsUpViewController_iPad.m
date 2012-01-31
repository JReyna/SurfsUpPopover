//
//  SurfsUpViewController_iPad.m
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

#import "SurfsUpViewController_iPad.h"

#import "DetailViewController_iPad.h"

@implementation SurfsUpViewController_iPad

@synthesize detailVC;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setClearsSelectionOnViewWillAppear:NO];
    [self setContentSizeForViewInPopover:CGSizeMake(320.0f, 480.0f)];
    
    NSIndexPath *initialPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [[self tableView] selectRowAtIndexPath:initialPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [[self detailVC] setTitle:[self tripNameForRowAtIndexPath:initialPath]];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self detailVC] setTitle:[self tripNameForRowAtIndexPath:indexPath]];
}

#pragma mark - Rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
