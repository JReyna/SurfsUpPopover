//
//  DetailViewController_iPad.h
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

@interface DetailViewController_iPad : UIViewController <UISplitViewControllerDelegate, UIPopoverControllerDelegate>
{    
    IBOutlet UIToolbar  *toolbar;    
    IBOutlet UISwitch   *rentSwitch;
}

@property (nonatomic, retain) UIPopoverController   *detailPopover;
@property (nonatomic, retain) UIPopoverController   *aboutPopover;
@property (nonatomic, retain) id                    lastTappedButton;

- (IBAction)aboutTapped:(id)sender;

@end
