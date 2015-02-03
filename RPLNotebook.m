#import "RPLNotebook.h"

@interface RPLNotebook ()

// Private interface goes here.

@end

@implementation RPLNotebook

// Custom logic goes here.

+(instancetype)notebookWithName:(NSString*) name context:(NSManagedObjectContext*)context{


    RPLNotebook *nb=[self insertInManagedObjectContext:context];
    nb.name=name;
    nb.creationDate=[NSDate date];
    nb.modificationDate=[NSDate date];
    
    
    return nb;

}




#pragma  mark - Util

-(NSArray*)observableKeys{

    return @[RPLNotebookAttributes.name,
             RPLNotebookRelationships.notes];

}




-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    
    //Solo me interes saber que algo ha cambiado
    self.modificationDate=[NSDate date];






}

















@end
