//
//  SocialTableViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 27..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "SocialTableViewController.h"
#import "SocialTableViewCell.h"
#import "WebViewController.h"


@interface SocialTableViewController ()

@end

@implementation SocialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background"]];
    
    self.tableView.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    
    
   // plist 를 가져오자
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Social" ofType:@"plist"];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    socialArray = dict[@"SocialMedia"];
    
    
    // 테이블 뷰의 항목 높이 설정
    self.tableView.rowHeight = 100;
    
    self.navigationItem.title = @"Social Links";
    
    // 뒤로가기 버튼 아이템 설정
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
    (NSInteger)section {
    
    // 배열의 사용량 만큼 반환
    return socialArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 선택된 cell을 가져온다.
    SocialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    // 연결된 리소스 값 설정
    NSDictionary *dict = socialArray[indexPath.row];
    
    cell.cellTitle.text = dict[@"Title"];
    cell.cellImageView.image = [UIImage imageNamed:dict[@"Image"]];
    
    cell.cellImageView.layer.cornerRadius = 5;
    cell.cellImageView.clipsToBounds = YES;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// 새로운 뷰로 segue way 할때
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // segue 의 아이디가 showDetail 이면
    if([[segue identifier] isEqualToString:@"showDetail"]) {
        
        // 뷰컨트롤러를 가져온다.
        WebViewController *detailView = [segue destinationViewController];
        
        // 선택된 인덱스경로를 가져온다.
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // 선택된 경로의 딕셔너리를 가져온다.
        NSDictionary *dict = socialArray[indexPath.row];
        
        detailView.detailModel = @[dict[@"Title"], dict[@"URL"]];
        
    }
    
}


@end
