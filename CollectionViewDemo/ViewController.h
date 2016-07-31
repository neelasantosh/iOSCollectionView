//
//  ViewController.h
//  CollectionViewDemo
//
//  Created by Rajesh on 14/12/15.
//  Copyright (c) 2015 CDAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *cartoonCollectionView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIButton *closebutton;

@property NSMutableArray *arrayCartoons;

- (IBAction)closeAction:(id)sender;


@end

