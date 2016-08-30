//
//  ViewController.m
//  Elliev2
//
//  Created by Jose Maciel on 8/29/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Start.h"

@interface Start ()

@end
BOOL mybool;
@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [GIDSignIn sharedInstance].uiDelegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (IBAction)didTapSignOut:(id)sender {
    [[GIDSignIn sharedInstance] signOut];

}




@end
