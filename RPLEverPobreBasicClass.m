//
//  RPLEverPobreBasicClass.m
//  EverPobre
//
//  Created by Raul Pedraza on 3/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLEverPobreBasicClass.h"

@implementation RPLEverPobreBasicClass



#pragma mark - Lifecycle

-(void)awakeFromInsert{
    
    [super awakeFromInsert];
    
    //se llamam una vez en al vida
    [self setupKVO];
    
    
}

-(void)awakeFromFetch {
    [super awakeFromFetch];
    
    //Se llama cojonal de veces
    [self setupKVO];
    
}

-(void)willTurnIntoFault{
    
    [super willTurnIntoFault];
    [self tearDownKVO];
    
}


#pragma  mark - Util

-(NSArray*)observableKeys{
    
    return nil;
    
}

#pragma mark - KVO

-(void)setupKVO{
    
    //alta en notificaciones para las propiedades que quiero observar
    
    
    for (NSString* key  in [self observableKeys]){
        
        
        [self addObserver:self
               forKeyPath:key
                  options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
        
    }
    
}

-(void)tearDownKVO{
    
    //Baja en todas las listas de spam
    for(NSString* key in [self observableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
        
    }
    
    
}
















@end
