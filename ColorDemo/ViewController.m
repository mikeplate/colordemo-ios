//
//  ViewController.m
//  ColorDemo
//
//  Created by Mike P on 2013-03-03.
//  Copyright (c) 2013 Mikael Plate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _red.value = 0;
    _green.value = 0;
    _blue.value = 0;
    
    NSUserDefaults* pref = [NSUserDefaults standardUserDefaults];
    if ([pref valueForKey:@"red"]!=nil) {
        _red.value = [pref floatForKey:@"red"];
        _green.value = [pref floatForKey:@"green"];
        _blue.value = [pref floatForKey:@"blue"];
    }
    
    [self updateView];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onColorDescTapped)];
    [_colorDesc setUserInteractionEnabled:YES];
    [_colorDesc addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onRedChanged:(id)sender {
    [self updateView];
}

- (IBAction)onGreenChanged:(id)sender {
    [self updateView];
}

- (IBAction)onBlueChanged:(id)sender {
    [self updateView];
}

- (void)updateView {
    int red = (int)(_red.value*255.0);
    int green = (int)(_green.value*255.0);
    int blue = (int)(_blue.value*255.0);

    NSString* desc = [NSString stringWithFormat:@"# %02x %02x %02x", red, green, blue];
    _colorDesc.text = desc;
    
    UIColor* color = [UIColor colorWithRed:_red.value green:_green.value blue:_blue.value alpha:1];
    _color.backgroundColor = color;
    
    NSUserDefaults* pref = [NSUserDefaults standardUserDefaults];
    [pref setFloat:_red.value forKey:@"red"];
    [pref setFloat:_green.value forKey:@"green"];
    [pref setFloat:_blue.value forKey:@"blue"];
    [pref synchronize];
}

- (void)onColorDescTapped {
    /*
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
     */

    int red = (int)(_red.value*255.0);
    int green = (int)(_green.value*255.0);
    int blue = (int)(_blue.value*255.0);
    NSString* link = [NSString stringWithFormat:@"http://www.color-hex.com/color/%02x%02x%02x", red, green, blue];
    NSURL* url = [NSURL URLWithString:link];
    [[UIApplication sharedApplication] openURL:url];
}
@end
