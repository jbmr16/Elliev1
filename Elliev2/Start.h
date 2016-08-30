//
//  ViewController.h
//  Elliev2
//
//  Created by Jose Maciel on 8/29/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>



@interface Start : UIViewController <GIDSignInUIDelegate>

@property(strong, nonatomic) IBOutlet GIDSignInButton *signInButton;

@property (strong, nonatomic) IBOutlet UIButton *entrar;

@property (strong, nonatomic) IBOutlet UILabel *lblentrar;
@property (strong, nonatomic) IBOutlet UIButton *singout;

@end

