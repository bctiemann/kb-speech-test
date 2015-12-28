//
//  ViewController.m
//  KB Test
//
//  Created by brian.tiemann on 12/28/15.
//  Copyright © 2015 brian.tiemann. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    inputTextView = [[UITextView alloc] initWithFrame:CGRectMake(36, 100, 248, 50)];
    inputTextView.layer.borderWidth = 1;
    inputTextView.layer.borderColor = [[UIColor blackColor] CGColor];
    [self.view addSubview:inputTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard {
    NSLog(@"Dismissing");
    [inputTextView endEditing:true];
}

@end
