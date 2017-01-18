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
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestion;
@property (nonatomic) NSMutableArray *answersArray;
@property (nonatomic) int nrCorrectAnswers;
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
    self.nextQuestion.userInteractionEnabled = NO;
    self.rightWrong.text = @"";    
}
- (IBAction)checkAnswer:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString: [self.model getData][1]]) {
        self.rightWrong.text = @"Correct!";
        self.nrCorrectAnswers++;
        
    }else{
        self.rightWrong.text = @"Wrong!";
    }
    self.nextQuestion.userInteractionEnabled = YES;
    self.answ1.userInteractionEnabled = NO;
    self.answ2.userInteractionEnabled = NO;
    self.answ3.userInteractionEnabled = NO;
    self.answ4.userInteractionEnabled = NO;
    
    if([self.model gameRound] == 5){
        [self halfTime];
    }else if([self.model gameRound] == 10){
        [self halfTime];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answ1.layer.cornerRadius = 10;
    self.answ2.layer.cornerRadius = 10;
    self.answ3.layer.cornerRadius = 10;
    self.answ4.layer.cornerRadius = 10;
    self.continueButton.layer.cornerRadius = 10;
    self.nextQuestion.layer.cornerRadius = 10;
    
    self.model = [[GameLogicModel alloc] init];
    self.continueButton.hidden = YES;
    [self generateQuestion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)halfTime{
    self.getQuestion.text = [NSString stringWithFormat:@"Correct answers: %d Wrong answers: %d", self.nrCorrectAnswers, [self.model gameRound] - self.nrCorrectAnswers];
    
    self.nextQuestion.hidden = YES;
    self.answ1.hidden = YES;
    self.answ2.hidden = YES;
    self.answ3.hidden = YES;
    self.answ4.hidden = YES;
    self.rightWrong.hidden = YES;
    self.continueButton.hidden = NO;
    [self.continueButton setTitle: @"Continue" forState:UIControlStateNormal];
    
    if(([self.model gameRound] == 10)){
    self.nextQuestion.hidden = YES;
    self.answ1.hidden = YES;
    self.answ2.hidden = YES;
    self.answ3.hidden = YES;
    self.answ4.hidden = YES;
    self.rightWrong.hidden = YES;
    self.continueButton.hidden = NO;
    [self.continueButton setTitle: @"Play again" forState:UIControlStateNormal];
    }
}
- (IBAction)continueQuiz:(UIButton *)sender {
    if(([self.model gameRound] == 5)){
    self.nextQuestion.hidden = NO;
    self.answ1.hidden = NO;
    self.answ2.hidden = NO;
    self.answ3.hidden = NO;
    self.answ4.hidden = NO;
    self.rightWrong.hidden = NO;
    self.continueButton.hidden = YES;
    self.nextQuestion.hidden = NO;
    [self generateQuestion:nil];
   
    }else if(([self.model gameRound] == 10)){
        [self.model newGame];
        [self generateQuestion:nil];
        self.nextQuestion.hidden = NO;
        self.answ1.hidden = NO;
        self.answ2.hidden = NO;
        self.answ3.hidden = NO;
        self.answ4.hidden = NO;
        self.rightWrong.hidden = NO;
        self.nextQuestion.hidden = NO;
        self.continueButton.hidden = YES;
        self.nrCorrectAnswers = 0;
    }
}

@end
