//
//  UIViewController+RPLNavigation.m
//  EverPobre
//
//  Created by Raul Pedraza on 4/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "UIViewController+RPLNavigation.h"

@implementation UIViewController (RPLNavigation)
//categoria que todos los UIViewCOntroller entenderán
-(UINavigationController*) rplWrappedInNavigation{
    
    UINavigationController *nav=[[UINavigationController alloc]init];
    [nav pushViewController:self animated:NO];
    
    return nav;

}


@end
