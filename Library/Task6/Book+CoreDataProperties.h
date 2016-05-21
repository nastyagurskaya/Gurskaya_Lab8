//
//  Book+CoreDataProperties.h
//  Library
//
//  Created by Admin on 21.05.16.
//  Copyright © 2016 Alexandra Ryzhevich. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Book.h"

NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *additionDate;
@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSNumber *ganre;
@property (nullable, nonatomic, retain) NSNumber *isRead;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *note;
@property (nullable, nonatomic, retain) NSNumber *pageAmount;
@property (nullable, nonatomic, retain) NSString *publishingHouse;
@property (nullable, nonatomic, retain) NSNumber *year;

@end

NS_ASSUME_NONNULL_END
