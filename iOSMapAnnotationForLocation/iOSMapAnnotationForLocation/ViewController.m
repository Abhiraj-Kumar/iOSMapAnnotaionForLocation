//
//  ViewController.m
//  iOSMapAnnotationForLocation
//
//  Created by Abhiraj on 16/05/15.
//  Copyright (c) 2015 Self. All rights reserved.
//

#import "ViewController.h"

#import "MapAnnotaionViewContoller.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MapAnnotaionViewContoller *mapAnnotaionViewController=[[MapAnnotaionViewContoller alloc]init];
    [self addChildViewController:mapAnnotaionViewController];
    [self.view addSubview:mapAnnotaionViewController.view];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
