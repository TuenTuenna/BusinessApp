//
//  PortfolioCollectionViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "PortfolioCollectionViewController.h"
#import "PortfolioCollectionViewCell.h"

@interface PortfolioCollectionViewController ()

@end

@implementation PortfolioCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageArray = @[@"Image1",@"Image2",@"Image3",@"Image4",@"Image5",@"Image1",@"Image2",@"Image3",@"Image4",@"Image5",@"Image1",@"Image2",@"Image3",@"Image4",@"Image5",@"Image1",@"Image2",@"Image3",@"Image4",@"Image5"];
    
    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background"]];
    
    self.collectionView.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return imageArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PortfolioCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    
    //
    cell.cellImageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    
    cell.cellImageView.layer.borderWidth = 5.0;
    [[cell.cellImageView layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    float width = [[UIScreen mainScreen] bounds].size.width;
    float heightCell = 0;
    float widthCell = 0;
    
    // 아이폰 x, 6, 6s, 7, 8
    if(width == 375){
        heightCell = 125;
        widthCell = 172;
    }
    
    // 아이폰 6+, 6s+, 7+, 8+
    if(width == 414){
        heightCell = 125;
        widthCell = 192;
    }
    
    // 아이폰 다른 모든 버전
    if(width == 320){
        heightCell = 125;
        widthCell = 145;
    }
    
    return CGSizeMake(widthCell, heightCell);
    
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
