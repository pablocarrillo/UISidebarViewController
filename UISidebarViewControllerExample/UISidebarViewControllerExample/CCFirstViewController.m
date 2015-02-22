//
//  CCFirstViewController.m
//  UISidebarViewControllerExample
//
//  Created by Pablo Isidoro Carrillo Alvarez on 22/02/2015.
//  Copyright (c) 2015 Carlin Creations. All rights reserved.
//

#import "CCFirstViewController.h"

#import "UISidebarViewController.h"

@interface CCFirstViewController ()

@end

@implementation CCFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    
    
    UIStoryboard* story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* newVC = [story instantiateViewControllerWithIdentifier:@"centerVC"];

    UIViewController* menuVC = [story instantiateViewControllerWithIdentifier:@"menuVC"];
    
    menuVC.view.frame = CGRectMake(0, 0, 250.f, self.view.frame.size.height);
    
    UIViewController *navVC = [[UINavigationController alloc] initWithRootViewController:newVC];
    
    UISidebarViewController *sidebarVC = [[UISidebarViewController alloc]
                                          initWithCenterViewController:navVC
                                          andSidebarViewController:menuVC];
    
    sidebarVC.sidebarWidth = 250.0f;
    sidebarVC.overlayOpacity = 0.0f;
    sidebarVC.direction = UISidebarViewControllerDirectionLeft;
    
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:sidebarVC action:@selector(toggleSidebar:)];
    
    [newVC.navigationItem setLeftBarButtonItem:barButtonItem];
    
    [self presentViewController:sidebarVC animated:YES completion:nil];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
