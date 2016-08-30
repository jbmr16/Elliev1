//
//  Aretes.m
//  Elliev2
//
//  Created by Jose Maciel on 8/30/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Aretes.h"

@interface Aretes ()
@property NSMutableArray *Titles;
@property NSMutableArray *Photos;
@property NSMutableArray *Details;
@property NSMutableArray *Price;
@property NSString *stTitleSelected;
@property NSString *stPhotoSelected;
@property NSString *stDetails;
@property NSString *stPrice;
@end

@implementation Aretes

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.Titles   = [[NSMutableArray alloc] initWithObjects: @"ART001", @"ART002", @"ART003", @"ART004",@"ART005",@"ART006", @"ART007", @"ART008", @"ART009",@"ART0010",nil];
    self.Photos   = [[NSMutableArray alloc] initWithObjects: @"a1.jpg", @"a2.jpg", @"a3.jpg", @"a4.jpg",@"a5.jpg",@"a6.jpg", @"a7.jpg", @"a8.jpg", @"a9.jpg",@"a10.jpg",nil];
    self.Details   = [[NSMutableArray alloc] initWithObjects:  @"c1.jpg", @"c2.jpg", @"c3.jpg", @"c4.jpg",@"c5.jpg",@"c6.jpg", @"c7.jpg", @"c8.jpg", @"c9.jpg",@"c10.jpg",nil];
    self.Price   = [[NSMutableArray alloc] initWithObjects: @"1.00", @".2.14", @"1.12", @"3.2",@"2.2",@"1.00", @".2.14", @"1.12", @"3.2",@"2.2",nil];
    
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.Titles.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellAret *cell = (cellAret *)[tableView dequeueReusableCellWithIdentifier:@"cellAret"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellAret" bundle:nil] forCellReuseIdentifier:@"cellAret"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellAret"];
    }
    //Fill cell with info from arrays
    cell.lblprod.text = self.Titles[indexPath.row];
    
    cell.lblimg.image =[UIImage imageNamed:self.Photos[indexPath.row]];
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.stTitleSelected = self.Titles[indexPath.row];
    self.stPhotoSelected = self.Photos[indexPath.row];
    self.stDetails = self.Details[indexPath.row];
    self.stPrice = self.Price[indexPath.row];
    
    
    [self performSegueWithIdentifier:@"goToAret" sender:self];
}

//--------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[AretesDetails class]]) {
        
        AretesDetails *destination     = [segue destinationViewController];
        destination.TitleSelected        = self.stTitleSelected;
        destination.PhotoSelected        = self.stPhotoSelected;
        destination.DetailsSelected = self.stDetails;
        destination.PriceSelected = self.stPrice;
        
    }
}
//-------------------------------------------------------------------------------
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}

@end
