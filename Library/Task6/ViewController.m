//
//  ViewController.m
//  Library
//
//  Created by Admin on 21.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSArray *booksResult;
    AppDelegate *app;
}

@property (strong, nonatomic) IBOutlet UITextField *tfBookName;
@property (strong, nonatomic) IBOutlet UITableView *bookTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    booksResult = [app getAllBooks];
    [_bookTable reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickSortByAuthor:(id)sender {
    booksResult = [app getAllBooksSortedByAuthor];
    [_bookTable reloadData];
}
- (IBAction)clickSortByYear:(id)sender {
    booksResult = [app getAllBooksSortedByYear];
    [_bookTable reloadData];
}
- (IBAction)clickSearchByName:(id)sender {
    booksResult = [app getBooksWithName:[_tfBookName text]];
    [_bookTable reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(booksResult == nil) {
        return 0;
    }
    return [booksResult count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    //Поиск ячейки
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    Book *book = (Book *)[booksResult objectAtIndex:indexPath.row];
    /*cell.textLabel.text = [NSString stringWithFormat:@"%@ : %@", rec.aviaCompany, rec.price];*/
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \"%@\" %@", book.author, book.name, book.year];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath) {
        [app setSelectedBook:booksResult[indexPath.row]];
    }
}


@end
