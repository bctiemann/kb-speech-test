//
//  KeyboardViewController.h
//  KB Test Keyboard
//
//  Created by brian.tiemann on 12/28/15.
//  Copyright © 2015 brian.tiemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@import AVFoundation;

@interface KeyboardViewController : UIInputViewController

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) NSDate *lastNagMessage;
@property (nonatomic, strong) NSArray *nagMessages;

@end
