//
//  RPLEverPobreBasicClass.h
//  EverPobre
//
//  Created by Raul Pedraza on 3/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

@import CoreData;

@interface RPLEverPobreBasicClass : NSManagedObject

-(NSArray*)observableKeys;
-(void)setupKVO;
-(void)tearDownKVO;
@end
