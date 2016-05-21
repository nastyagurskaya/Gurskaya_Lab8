//
//  AppDelegate.h
//  Library
//
//  Created by Admin on 21.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Book.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property NSArray *bookGanres;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (NSString *)getGanreByNumber:(NSInteger)number;
- (NSArray *)getGanres;
- (NSArray*)getAllBooks;
- (NSArray *)getAllBooksSortedByAuthor;
- (NSArray *)getAllBooksSortedByYear;
- (NSArray *)getBooksWithName:(NSString *)name;
- (void)setSelectedBook:(Book *)book;
- (Book *)getBookToShow;


@end

