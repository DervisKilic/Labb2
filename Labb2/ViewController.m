//
//  ViewController.m
//  Labb2
//
//  Created by Dervis Kilic on 17/01/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

#import "ViewController.h"
#import "GameLogicModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *change;
@property (nonatomic) GameLogicModel *model;


@end

@implementation ViewController
- (IBAction)test:(UIButton *)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[GameLogicModel alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
