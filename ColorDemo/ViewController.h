//
//  ViewController.h
//  ColorDemo
//
//  Created by Mike P on 2013-03-03.
//  Copyright (c) 2013 Mikael Plate. All rights reserved.
//

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
