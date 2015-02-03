// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RPLNotebook.m instead.

#import "_RPLNotebook.h"

const struct RPLNotebookAttributes RPLNotebookAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
};

const struct RPLNotebookRelationships RPLNotebookRelationships = {
	.notes = @"notes",
};

@implementation RPLNotebookID
@end

@implementation _RPLNotebook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Notebook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Notebook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Notebook" inManagedObjectContext:moc_];
}

- (RPLNotebookID*)objectID {
	return (RPLNotebookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

