//
//  Record+CoreDataProperties.h
//  Flight
//
//  Created by Admin on 21.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Record.h"

NS_ASSUME_NONNULL_BEGIN

@interface Record (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *aviaCompany;
@property (nullable, nonatomic, retain) NSString *cityFrom;
@property (nullable, nonatomic, retain) NSString *cityTo;
@property (nullable, nonatomic, retain) NSNumber *price;

@end

NS_ASSUME_NONNULL_END
