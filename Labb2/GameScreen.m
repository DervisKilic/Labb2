//
//  GameScreen.m
//  Labb2
//
//  Created by Dervis Kilic on 17/01/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

#import "GameScreen.h"
#import "GameLogicModel.h"

@interface GameScreen ()
@property (nonatomic) GameLogicModel *model;
@property (weak, nonatomic) IBOutlet UILabel *getQuestion;
@property (weak, nonatomic) IBOutlet UIButton *answ1;
@property (weak, nonatomic) IBOutlet UIButton *answ2;
@property (weak, nonatomic) IBOutlet UIButton *answ3;
@property (weak, nonatomic) IBOutlet UIButton *answ4;
@property (nonatomic) NSMutableArray *answersArray;
@property (weak, nonatomic) IBOutlet UILabel *rightWrong;

@end

@implementation GameScreen
- (IBAction)generateQuestion:(UIButton *)sender {
    [self.model setupData];
    
    self.answersArray = [NSMutableArray arrayWithObjects: [self.model getData][1], [self.model getData][2], [self.model getData][3], [self.model getData][4], nil];
    
  
        for (NSUInteger i = [self.answersArray count]; i > 1; i--) [self.answersArray exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
        
        self.getQuestion.text = [self.model getData][0];
        [self.answ1 setTitle:self.answersArray[0] forState:UIControlStateNormal];
        [self.answ2 setTitle:self.answersArray[1] forState:UIControlStateNormal];
        [self.answ3 setTitle:self.answersArray[2] forState:UIControlStateNormal];
        [self.answ4 setTitle:self.answersArray[3] forState:UIControlStateNormal];
    
    self.answ1.userInteractionEnabled = YES;
    self.answ2.userInteractionEnabled = YES;
    self.answ3.userInteractionEnabled = YES;
    self.answ4.userInteractionEnabled = YES;
    self.rightWrong.text = @"";
    
     
    
}
- (IBAction)checkAnswer:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString: [self.model getData][1]]) {
        self.rightWrong.text = @"Correct!";
        
    }else{
        self.rightWrong.text = @"Wrong!";
    }
    
    self.answ1.userInteractionEnabled = NO;
    self.answ2.userInteractionEnabled = NO;
    self.answ3.userInteractionEnabled = NO;
    self.answ4.userInteractionEnabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[GameLogicModel alloc] init];
    [self generateQuestion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
