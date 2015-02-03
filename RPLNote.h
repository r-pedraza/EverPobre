#import "_RPLNote.h"


@interface RPLNote : _RPLNote {}
// Custom logic goes here.

+(instancetype)noteWithName:(NSString*) name
                   notebook:(RPLNotebook*)notebook
                    context:(NSManagedObjectContext*)context;










@end
