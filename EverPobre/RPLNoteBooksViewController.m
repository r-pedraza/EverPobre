//
//  RPLNoteBooksViewController.m
//  EverPobre
//
//  Created by Raul Pedraza on 4/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLNoteBooksViewController.h"
#import "RPLNotebook.h"
#import "RPLNotesViewController.h"
#import "RPLNote.h"
#import "RPLTableViewCell.h"

@interface RPLNoteBooksViewController ()

@end

@implementation RPLNoteBooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"Everpobre";
    
    //añadimos botón de nueva libreta
    UIBarButtonItem * addBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNoteBook:)];
    self.navigationItem.rightBarButtonItem=addBtn;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    RPLNotebook *nb=[self.fetchedResultsController objectAtIndexPath:indexPath];
    static NSString *cellId=@"Cell";

    
//averiguar de que libreta me hablan
    /*
    //Creo una celda
    static NSString *cellId=@"NotebookId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //la configuro
    cell.textLabel.text=nb.name;
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateStyle=NSDateFormatterShortStyle;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@(%lu notes)",[fmt stringFromDate:nb.modificationDate],(unsigned long)nb.notes.count];
    */
        RPLTableViewCell *personaCell=[tableView dequeueReusableCellWithIdentifier:cellId                                                          forIndexPath:indexPath];
        
    
   
    personaCell.labelName.text=nb.name;
    personaCell.labelNote.text=[NSString stringWithFormat:@"%lu",(unsigned long)[nb.notes count]];
    
    //la devuelvo
    return personaCell;

}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Averiguar quien se quiere eliminar
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        //borramos la libreta, pero ¿cual es?
        
        NSManagedObjectContext *ctx=self.fetchedResultsController.managedObjectContext;
        RPLNotebook *difunto=[self.fetchedResultsController objectAtIndexPath:indexPath];
        
        [ctx deleteObject:difunto];
        
    }

}

//Método que cambia el texto del boton borrar
-(NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

return @"Remove";

}

#pragma mark - Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    //Averiguar cul fue la libreta
    RPLNotebook *nb=[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    //creo la seleccion de datos
    NSFetchRequest *r=[NSFetchRequest fetchRequestWithEntityName:[RPLNote entityName]];
    
    r.fetchBatchSize=30;
    r.sortDescriptors=@[[NSSortDescriptor sortDescriptorWithKey:RPLNoteAttributes.name
                                                      ascending:YES selector:@selector(caseInsensitiveCompare:)]];
    
    r.predicate=[NSPredicate predicateWithFormat:@"notebook == %@",nb];
    
    
    //creo una instacia de controlador de notas
    NSFetchedResultsController *fc=[[NSFetchedResultsController alloc]initWithFetchRequest:r managedObjectContext:self.fetchedResultsController.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    RPLNotesViewController *nVC=[[RPLNotesViewController alloc]initWithFetchedResultsController:fc style:UITableViewStylePlain];
    
    nVC.notebook=nb;
    
    
    //lo pusheo

    [self.navigationController pushViewController:nVC animated:YES];
    
    
    
    

}

#pragma mark - Actions
-(void)addNoteBook:(id)sender{

    [RPLNotebook notebookWithName:@"Nueva Libreta" context:self.fetchedResultsController.managedObjectContext];
}

@end
