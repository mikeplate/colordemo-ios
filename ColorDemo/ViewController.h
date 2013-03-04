#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UILabel *_colorDesc;
    IBOutlet UIView *_color;
    IBOutlet UISlider *_red;
    IBOutlet UISlider *_green;
    IBOutlet UISlider *_blue;
}

- (IBAction)onRedChanged:(id)sender;
- (IBAction)onGreenChanged:(id)sender;
- (IBAction)onBlueChanged:(id)sender;

@end
