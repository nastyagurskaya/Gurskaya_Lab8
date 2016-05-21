//
//  AppDelegate.m
//  Flight
//
//  Created by Admin on 21.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "Record.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (![[NSUserDefaults standardUserDefaults]
          boolForKey:@"HasLaunchedOnce"]) { [[NSUserDefaults
                                              standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] synchronize];
    Record * thigFlight = [NSEntityDescription insertNewObjectForEntityForName:@"Record"
                                                         inManagedObjectContext:self.managedObjectContext];
    thigFlight.cityFrom = @"Kiev";
    thigFlight.cityTo = @"Minsk"; thigFlight.aviaCompany =
    @"Ukrain airlines";
    thigFlight.price = [NSNumber
                         numberWithInt:500.0]; Record * fourtFlight =
    [NSEntityDescription
     insertNewObjectForEntityForName:@"Record"
     inManagedObjectContext:self.managedObjectContext];
    fourtFlight.cityFrom = @"Vilnius";
    fourtFlight.cityTo = @"Minsk";
    fourtFlight.aviaCompany =
    @"FlyLAL"; fourtFlight.price = [NSNumber
                                      numberWithInt:500.0];
    Record * fivуFlight =[NSEntityDescription
                           insertNewObjectForEntityForName:@"Record"
                           inManagedObjectContext:self.managedObjectContext];
    fivуFlight.cityFrom = @"Minsk";
    fivуFlight.cityTo = @"St.Peterburg";
    fivуFlight.aviaCompany = @"Belavia";
    fivуFlight.price = [NSNumber numberWithInt:8000.0];
    Record * sixFlight =
    [NSEntityDescription
     insertNewObjectForEntityForName:@"Record"
     inManagedObjectContext:self.managedObjectContext];
    sixFlight.cityFrom = @"Moscow";
    sixFlight.cityTo = @"Vilnius";
    sixFlight.aviaCompany =
    @"FlyLAL";
    sixFlight.price = [NSNumber
                                     numberWithInt:1500.0]; [self saveContext];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "myorg.Flight" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Flight" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Flight.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
        NSError *error = nil; NSManagedObjectContext *managedObjectCont =
        self.managedObjectContext; if(nil != managedObjectCont) {
            if([managedObjectCont hasChanges] && ![managedObjectCont save:&error]){
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort(); }
        }
}
- (NSArray *)getFlightsWithCityFrom:(NSString *)cityFrom andCityTo:(NSString *)cityTo
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"cityFrom == %@ and cityTo == %@", cityFrom, cityTo]];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return [fetchedRecords sortedArrayUsingComparator: ^NSComparisonResult(id obj1, id obj2) {
        if(((Record *)obj1).price < ((Record *)obj2).price) {
            return NSOrderedAscending;
        }
        if(((Record *)obj1).price > ((Record *)obj2).price) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
}

- (NSArray*)getAllFlights
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return fetchedRecords;
}
@end
