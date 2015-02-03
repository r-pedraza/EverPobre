// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RPLPhotoData.h instead.

@import CoreData;
#import "RPLEverPobreBasicClass.h"

extern const struct RPLPhotoDataAttributes {
	__unsafe_unretained NSString *photoData;
} RPLPhotoDataAttributes;

extern const struct RPLPhotoDataRelationships {
	__unsafe_unretained NSString *notes;
} RPLPhotoDataRelationships;

@class RPLNote;

@interface RPLPhotoDataID : NSManagedObjectID {}
@end

@interface _RPLPhotoData : RPLEverPobreBasicClass {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) RPLPhotoDataID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _RPLPhotoData (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(RPLNote*)value_;
- (void)removeNotesObject:(RPLNote*)value_;

@end

@interface _RPLPhotoData (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
