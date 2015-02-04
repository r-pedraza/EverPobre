//
//  RPLNotesViewController.m
//  EverPobre
//
//  Created by Raul Pedraza on 4/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLNotesViewController.h"
#import "RPLNote.h"
#import "RPLPhotoData.h"
#import "RPLTableViewCell.h"

@implementation RPLNotesViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //agregamos nton de aadir notas
    UIBarButtonItem *b=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                    target:self action:@selector(addNote:)];
    
    self.navigationItem.rightBarButtonItem=b;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title=self.notebook.name;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView
       cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //Averiguar la nota
    RPLNote *note=[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    //Creamos la celda
    static NSString *cellId=@"noteCell";
    RPLTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[RPLTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //la configuramos
    cell.imageView.image=note.photo.image;
    cell.textLabel.text=note.name;
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateStyle=NSDateIntervalFormatterMediumStyle;
    cell.detailTextLabel.text=[fmt stringFromDate:note.modificationDate];
    
    
    //La devolvemos
    return cell;
}






#pragma mark - Actions
-(void)addNote:(id)sender{
    [RPLNote noteWithName:@"Nueva Nota" notebook:self.notebook context:self.notebook.managedObjectContext];

}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar quien se quiere eliminar
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //borramos la libreta, pero ¿cual es?
        
        NSManagedObjectContext *ctx=self.fetchedResultsController.managedObjectContext;
        RPLNote *difunto=[self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
        
    }
    
}
//Método que cambia el texto del boton remove.
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return @"Remove";
    
}



@end
