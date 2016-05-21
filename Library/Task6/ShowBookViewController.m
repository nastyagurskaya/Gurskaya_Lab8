//
//  ShowBookViewController.m
//  Library
//
//  Created by Admin on 21.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ShowBookViewController.h"

@interface ShowBookViewController () {
    AppDelegate *app;
    Book *book;
}

@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelAuthor;
@property (strong, nonatomic) IBOutlet UILabel *labelGanre;
@property (strong, nonatomic) IBOutlet UILabel *labelPageAmount;
@property (strong, nonatomic) IBOutlet UILabel *labelPublishingHouse;

@property (strong, nonatomic) IBOutlet UILabel *labelDate;
@property (strong, nonatomic) IBOutlet UILabel *labelIsRead;

@property (strong, nonatomic) IBOutlet UILabel *LabelYear;


@end

@implementation ShowBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    book = [app getBookToShow];
    if(book != nil) {
        [self showBookInfo];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)showBookInfo {
    [_labelName setText:book.name];
    [_labelAuthor setText:book.author];
    [_LabelYear setText:[NSString stringWithFormat:@"%@", book.year]];
    [_labelGanre setText:[app getGanreByNumber:[book.ganre integerValue]]];
    [_labelPageAmount setText:[NSString stringWithFormat:@"%@ pages", book.pageAmount]];
    [_labelPublishingHouse setText:book.publishingHouse];
    [_labelDate setText:[NSString stringWithFormat:@"%@", book.additionDate]];
    if([book.isRead boolValue]) {
        [_labelIsRead setText:@"Yes"];
    } else {
        [_labelIsRead setText:@"No"];
    }
}

@end
