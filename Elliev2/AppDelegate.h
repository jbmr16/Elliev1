//
//  AppDelegate.h
//  Elliev2
//
//  Created by Jose Maciel on 8/29/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAI.h"

#import <Google/SignIn.h>



@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

