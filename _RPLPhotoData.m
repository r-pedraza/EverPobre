// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RPLPhotoData.m instead.

#import "_RPLPhotoData.h"

const struct RPLPhotoDataAttributes RPLPhotoDataAttributes = {
	.photoData = @"photoData",
};

const struct RPLPhotoDataRelationships RPLPhotoDataRelationships = {
	.notes = @"notes",
};

@implementation RPLPhotoDataID
@end

@implementation _RPLPhotoData

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (RPLPhotoDataID*)objectID {
	return (RPLPhotoDataID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

