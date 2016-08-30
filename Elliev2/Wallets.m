//
//  Wallets.m
//  Elliev2
//
//  Created by Jose Maciel on 8/30/16.
//  Copyright © 2016 Jose Maciel. All rights reserved.
//

#import "Wallets.h"

@interface Wallets ()
@property NSMutableArray *Titles;
@property NSMutableArray *Photos;
@property NSMutableArray *Details;
@property NSMutableArray *Price;
@property NSString *stTitleSelected;
@property NSString *stPhotoSelected;
@property NSString *stDetails;
@property NSString *stPrice;
@end

@implementation Wallets

- (void)viewDidLoad {
    [super viewDidLoad];
     [self initController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.Titles   = [[NSMutableArray alloc] initWithObjects: @"WLL001", @"WLL002", @"WLL003", @"WLL004",@"WLL005",@"WLL006", @"WLL007", @"WLL008", @"WLL009",@"WLL0010",nil];
    self.Photos   = [[NSMutableArray alloc] initWithObjects: @"w1.jpg", @"w2.jpg", @"w3.jpg", @"w4.jpg",@"w5.jpg",@"w6.jpg", @"w7.jpg", @"w8.jpg", @"w9.jpg",@"w10.jpg",nil];
    self.Details   = [[NSMutableArray alloc] initWithObjects:  @"Billetero y monedero mediano con solapa en piel de ternera con el Anagrama en relieve. Cacterísticas: compartimento central para monedas, cinco espacios para tarjetas,", @" El T Pouch con cierre de cremallera en piel de ternera ejemplifica la maestría artesanal de Loewe; muestra una silueta limpia y entallada con la característica construcción artesanal de dos pieles en forma de T", @"Cartera grande de piel de ternera con Anagrama grabado y solapa. Características principales: catorce compartimentos para tarjetas, ", @"Bolso de mano con cremallera en piel suave. El dibujo en hongos está plasmado utilizando la artesana técnica de Marquetería en piel, con diferentes piezas de piel cortadas a medida e incrustadas.",@"spaciosa cartera de piel flexible con logo de Tommy Hilfiger en la solapa.",@"Cartera billetero con cierre de solapa en colores naturales. ", @"Billetero de piel vacuno con grabado de flores de alta calidad. Monedero exterior con cierre de botón a presión y dos departamentos para monedas separados por un bolsillo con cremallera", @"Billetero de piel vacuno con grabado de flores de alta calidad.Monedero exterior con cierre de botón a presión y dos departamentos para monedas separados por un bolsillo con cremallera.", @"Conjunto de monedero y billetero a juego. En piel vacuno con grabado imitando a cocodrilo.",@"Monedero y billetero de mujer en piel vacuno acabado serraje combinado con piel lisa Disponible en varios colores, todos muy alegres y llamativos",nil];
    self.Price   = [[NSMutableArray alloc] initWithObjects: @"331.00", @".222.14", @"144.12", @"322.2",@"266.2",@"199.00", @".255.14", @"144.12", @"322.2",@"233.2",nil];
    
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
    cellWall *cell = (cellWall *)[tableView dequeueReusableCellWithIdentifier:@"cellWall"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellWall" bundle:nil] forCellReuseIdentifier:@"cellWall"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellWall"];
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
    
    
    [self performSegueWithIdentifier:@"goToWall" sender:self];
}

//--------------
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[WalletsDetails class]]) {
        
        WalletsDetails *destination     = [segue destinationViewController];
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
