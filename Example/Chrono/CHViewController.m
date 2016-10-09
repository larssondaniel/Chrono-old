//
//  CHViewController.m
//  Chrono
//
//  Created by Daniel Larsson on 10/08/2016.
//  Copyright (c) 2016 Daniel Larsson. All rights reserved.
//

#import "CHViewController.h"
#import "Chrono/Chrono.h"

@interface CHViewController ()

@end

@implementation CHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self performHeavyCalculations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)performHeavyCalculations
{
    [Chrono start:@"myHeavyTask"];

    for (NSInteger i = 0; i < 50000; i++)
    {
        // Do work
    }

    [Chrono addEvent:@"finishedFirstPart" forOperation:@"myHeavyTask"];

    for (NSInteger i = 0; i < 10000; i++)
    {
        // Do work
    }

    [Chrono stop:@"myHeavyTask"];
}

@end
