//
//  Bolsas.m
//  Elliev2
//
//  Created by Jose Maciel on 8/30/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Bolsas.h"

@interface Bolsas ()
@property NSMutableArray *Titles;
@property NSMutableArray *Photos;
@property NSMutableArray *Details;
@property NSMutableArray *Price;
@property NSString *stTitleSelected;
@property NSString *stPhotoSelected;
@property NSString *stDetails;
@property NSString *stPrice;
@end

@implementation Bolsas

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)initController {
    self.Titles   = [[NSMutableArray alloc] initWithObjects: @"BLS001", @"BLS002", @"BLS003", @"BLS004",@"BLS005",@"BLS006", @"BLS007", @"BLS008", @"BLS009",@"BLS0010",nil];
    self.Photos   = [[NSMutableArray alloc] initWithObjects: @"b1.jpg", @"b2.jpg", @"b3.jpg", @"b4.jpg",@"b5.jpg",@"b6.jpg", @"b7.jpg", @"b8.jpg", @"b9.jpg",@"b10.jpg",nil];
    self.Details   = [[NSMutableArray alloc] initWithObjects:  @"Bolso de mano color negro. Detalle bolsillo exterior. Metalería dorada. Asas de mano y asa de hombro ajustable y extraible. Varios compartimentos internos. Cierre mediante imán y cremallera", @"Bolso formato city color blanco. Bolsillo exterior con detalle de colgador en forma de candado. Metalería dorada. Asas de mano y asa de hombro ajustable y extraíble. Forro con bolsillo interior.", @"Mochila convertible en bandolera color negro. Dos asas extraíbles y ajustables y un asa en cadena extraíble. Forro interior con bolsillo.", @"Bolso formato bandolera. Acabado acolchado. Metalería dorada. Asa de hombro ajustable en cadena. Forro con bolsillo interior.",@"Bolso formato city de piel color gris. Bolsillo en la parte delantera con dos cremalleras laterales con tiradores de piel y cierre mediante imán. Interior forrado con un bolsillo.",@"Bolso de piel formato shopper. Color cuero. Detalle asas ajustables con hebillas redondas. Forro interior con dos compartimientos y un bolsillo. ", @"Bolso formato mochila mini color azul. Detalle bolsillo exterior con cremallera. Metalería plateada. Asas de hombro en combinación de materiales. Cierre mediante fruncido.", @"Bolso formato mochila mini en combinación de colores. Detalle bolsillo exterior con cremallera. Metalería plateada. Asas de hombro en combinación de materiales.", @"Bolso bandolera en combinación de colores. Detalle abalorios en combinación de colores y formas. Asa de hombro con trenzado. Forro interior. Cierre mediante fruncido y borlas trabajadas.",@"Bolso formato saca de piel color teja. Asa de mano y asa de hombro extraíble. Cierre mediante fruncido con tira e imán interior. Forro con bolsillo interior. ",nil];
    self.Price   = [[NSMutableArray alloc] initWithObjects: @"888.00", @".766.14", @"911.12", @"973.2",@"872.2",@"651.00", @".882.14", @"991.12", @"773.2",@"882.2",nil];
    
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
    cellBolsa *cell = (cellBolsa *)[tableView dequeueReusableCellWithIdentifier:@"cellBolsa"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellBolsa" bundle:nil] forCellReuseIdentifier:@"cellBolsa"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellBolsa"];
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
    
    
    [self performSegueWithIdentifier:@"goToBag" sender:self];
}

//--------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[BolsasDetails class]]) {
        
        BolsasDetails *destination     = [segue destinationViewController];
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
