//
//  ServicesTableViewController.m
//  TuenTuennaBusinessApp
//
//  Created by Jeff Jeong on 2019. 6. 26..
//  Copyright © 2019년 Tuentuenna. All rights reserved.
//

#import "ServicesTableViewController.h"
#import "ServicesTableViewCell.h"
#import "ServicesViewController.h"

@interface ServicesTableViewController ()

@end

@implementation ServicesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 테이블뷰 각 아이템 높이 설정
    self.tableView.rowHeight = 80;
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Background"]];
    
    self.tableView.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    
    
    // ServiceList.plist 의 경로를 가져온다.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ServiceList" ofType:@"plist"];
    // 가져온 경로의 딕셔너리 메모리 할당
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    dataSelect = dict[@"Services"];
    
    // 뒤로가기 버튼 아이템 설정 
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // 데이터 배열 크기 반환
    return dataSelect.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ServicesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *dict = dataSelect[indexPath.row];
    
    cell.cellLabel.text = dict[@"Title"];
    cell.backgroundColor = [UIColor clearColor];
    
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    // 세그웨이 아이디가 showDetail 이면
    if([[segue identifier] isEqualToString:@"showDetail"]){
        
        // 서비스뷰 컨트롤러를 가져온다.
        ServicesViewController *detailView = [segue destinationViewController];
        
        // 테이블 뷰에서 선택된 아이템 인덱스경로 가져오기
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // 가져온 인덱스에 해당하는 딕션너리 선택
        NSDictionary *dict = dataSelect[indexPath.row];
        
        detailView.detailModel = @[dict[@"Title"], dict[@"Image"], dict[@"Description"]];
        
        
    }
    
}


@end
