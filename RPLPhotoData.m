#import "RPLPhotoData.h"

@interface RPLPhotoData ()

// Private interface goes here.

@end

@implementation RPLPhotoData

// Custom logic goes here.
-(UIImage*)image{

    return [UIImage imageWithData:self.photoData];
    

}

-(void) setImage:(UIImage *)image{
        //set personalizado
    self.photoData=UIImageJPEGRepresentation(image, 0.9);
}

@end
