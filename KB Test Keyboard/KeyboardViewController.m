//
//  KeyboardViewController.m
//  KB Test Keyboard
//
//  Created by brian.tiemann on 12/28/15.
//  Copyright © 2015 brian.tiemann. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (nonatomic, strong) UIButton *speakMessageButton;
@property (nonatomic, strong) AVAudioPlayer *backgroundMusicPlayer;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];


    
    self.speakMessageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.speakMessageButton setTitle:NSLocalizedString(@"Speak Message", @"Title for 'Speak Message' button") forState:UIControlStateNormal];
    [self.speakMessageButton sizeToFit];
    self.speakMessageButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.speakMessageButton addTarget:self action:@selector(speakMessage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.speakMessageButton];
    
    self.synthesizer = [[AVSpeechSynthesizer alloc]init];

}

- (void)speakMessage {
//    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString: @"Please don't text and drive."];
//    [self.synthesizer speakUtterance:utterance];
    
    NSError *error;
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"nag01" ofType:@"m4a"];
/*
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    self.backgroundMusicPlayer = [[AVAudioPlayer alloc]
                                  initWithContentsOfURL:audioURL error:&error];
    [self.backgroundMusicPlayer prepareToPlay];
    [self.backgroundMusicPlayer play];
*/
    
    SystemSoundID soundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: audioPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
