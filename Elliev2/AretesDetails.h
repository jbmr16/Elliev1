//
//  AretesDetails.h
//  Elliev2
//
//  Created by Jose Maciel on 8/30/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"


@interface AretesDetails : UIViewController <PayPalPaymentDelegate>

@property NSString *TitleSelected;
@property NSString *PhotoSelected;
@property NSString *DetailsSelected;
@property NSString *PriceSelected;

@property (strong, nonatomic) IBOutlet UIImageView *lblimg;
@property (strong, nonatomic) IBOutlet UILabel *lbldesc;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *buybttn;
@property (strong, nonatomic) IBOutlet UIView *ADetails;


@end
