//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import "ViewController.h"
#import "Cartoon.h"
#import "CartoonCollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize cartoonCollectionView,arrayCartoons,imageView,closebutton;
- (void)viewDidLoad {
    [super viewDidLoad];
    //initialize datasource and delegate
    
    cartoonCollectionView.dataSource = self;
    cartoonCollectionView.delegate = self;
    
    //itialize array with cartoon objects
    
    Cartoon *c1 = [[Cartoon alloc]init];
    c1.title = @"Donald";
    c1.imageName = @"Donald-Duck.jpg";
    Cartoon *c2 = [[Cartoon alloc]init];
    c2.title = @"Jerry";
    c2.imageName = @"jerry.jpg";
    Cartoon *c3 = [[Cartoon alloc]init];
    c3.title = @"Pickachu";
    c3.imageName = @"picka.jpg";
    Cartoon *c4 = [[Cartoon alloc]init];
    c4.title = @"Smurf";
    c4.imageName = @"smurf.jpg";
    Cartoon *c5 = [[Cartoon alloc]init];
    c5.title = @"Tom";
    c5.imageName = @"tom.jpg";

    //load cell xib and attach with collectionView
    UINib *cellNib = [UINib nibWithNibName:@"CartoonCollectionViewCell" bundle:nil];
    [cartoonCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"cartoon_cell"];
    
    arrayCartoons = [[NSMutableArray alloc]initWithObjects:c1,c2,c3,c4,c5, nil];
    
}//eof didload

//1.decide section

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//2.decide no of items
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrayCartoons.count;//return no of items present
}

//3.cell for items
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //create cell object and fill its view with cartoon data
    CartoonCollectionViewCell *cell = [cartoonCollectionView dequeueReusableCellWithReuseIdentifier:@"cartoon_cell" forIndexPath:indexPath];
    
    Cartoon *cartoon = [arrayCartoons objectAtIndex:indexPath.row];
    cell.label.text = cartoon.title;
    cell.imageView.image = [UIImage imageNamed:cartoon.imageName];
    
    return cell;
}

//4.item selection event handling

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cartoon *cartoon = [arrayCartoons objectAtIndex:indexPath.row];
    NSLog(@"cartoon:%@",cartoon.title);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeAction:(id)sender {
    [imageView setHidden:false];
}
@end
