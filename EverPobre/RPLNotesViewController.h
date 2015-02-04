//
//  RPLNotesViewController.h
//  EverPobre
//
//  Created by Raul Pedraza on 4/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "RPLNotebook.h"


@interface RPLNotesViewController : AGTCoreDataTableViewController



@property (strong,nonatomic) RPLNotebook *notebook;

@end
