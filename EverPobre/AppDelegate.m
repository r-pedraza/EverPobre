//
//  AppDelegate.m
//  EverPobre
//
//  Created by Raul Pedraza on 2/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "AppDelegate.h"
#import "RPLNote.h"
#import "RPLNotebook.h"
#import "RPLPhotoData.h"
#import "RPLNoteBooksViewController.h"
#import "UIViewController+RPLNavigation.h"

@interface AppDelegate ()
@property (nonatomic,strong)AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //creamos el stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    
    [self createDummyData];
    
    //creamis el conjunto de datosns
    NSFetchRequest *r=[NSFetchRequest fetchRequestWithEntityName:[RPLNotebook entityName]];
    r.fetchBatchSize=30;
    r.sortDescriptors=@[[NSSortDescriptor sortDescriptorWithKey:RPLNoteAttributes.name
                                                      ascending:YES selector:@selector(caseInsensitiveCompare:)]];
    
    NSFetchedResultsController *fc=[[NSFetchedResultsController alloc]initWithFetchRequest:r
                                                                      managedObjectContext:self.stack.context
                                                                        sectionNameKeyPath:nil
cacheName:nil];
    
    //creamos el controlador
    RPLNoteBooksViewController *vc=[[RPLNoteBooksViewController alloc]initWithFetchedResultsController:fc
                                                                                                 style:UITableViewStylePlain];
    
   
    //los mostramos
    self.window.rootViewController= [vc rplWrappedInNavigation];

    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
}

-(void)createDummyData{
    
    [self.stack zapAllData];

    RPLNotebook *nb=[RPLNotebook notebookWithName:@"Ex-novias para el recuerdo" context:self.stack.context];
    
    [RPLNote noteWithName:@"Mariana Dávalos" notebook:nb context:self.stack.context];
    [RPLNote noteWithName:@"Camila Dávalos" notebook:nb context:self.stack.context];
    [RPLNote noteWithName:@"Pampita Dávalos" notebook:nb context:self.stack.context];

    //Fisgoneamos
    NSLog(@"Libreta:%@",nb);
    NSLog(@"Exs:%@",nb.notes);
    
    
    
}













@end
