#import "RPLNote.h"
#import "RPLPhotoData.h"
#import "RPLNotebook.h"

@interface RPLNote ()

// Private interface goes here.

@end

@implementation RPLNote

// Custom logic goes here.


+(instancetype)noteWithName:(NSString*) name
                   notebook:(RPLNotebook*)notebook
                    context:(NSManagedObjectContext*)context{

    RPLNote *note=[self insertInManagedObjectContext:context];
    note.name=name;
    note.noteBook=notebook;
    note.creationDate=[NSDate date];
    note.photo=[RPLPhotoData insertInManagedObjectContext:context];
    note.modificationDate=[NSDate date];

    return note;

}




#pragma  mark - Util

-(NSArray*)observableKeys{
    
    return @[RPLNoteAttributes.name,
             RPLNoteAttributes.text,
             RPLNoteRelationships.noteBook,
             RPLNoteRelationships.photo,
             @"photo.photData"];
    
}


-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    
    //Solo me interes saber que algo ha cambiado
    self.modificationDate=[NSDate date];
    
    
    
    
    
    
}














@end
