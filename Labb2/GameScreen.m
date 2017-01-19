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
@property (nonatomic) int nrCorrectAnswers;
@property (weak, nonatomic) IBOutlet UILabel *rightWrong;

@end

@implementation GameScreen
- (IBAction)generateQuestion:(UIButton *)sender {
    [self.model setupData];

    self.getQuestion.text = [self.model getQuestion][0];
    [self.answ1 setTitle:[self.model getQuestion][1] forState:UIControlStateNormal];
    [self.answ2 setTitle:[self.model getQuestion][2] forState:UIControlStateNormal];
    [self.answ3 setTitle:[self.model getQuestion][3] forState:UIControlStateNormal];
    [self.answ4 setTitle:[self.model getQuestion][4] forState:UIControlStateNormal];
    
    self.rightWrong.text = @"";
    [self enableButtons:YES];
}
- (IBAction)checkAnswer:(UIButton *)sender {
    
    if ([sender.currentTitle isEqualToString: [self.model correctAnswer]]) {
        self.rightWrong.text = @"Correct!";
        sender.layer.backgroundColor = [UIColor greenColor].CGColor;
      
        
        
        self.nrCorrectAnswers++;
        
    }else{
        self.rightWrong.text = @"Wrong!";
        sender.layer.backgroundColor = [UIColor redColor].CGColor;
        
    }
    
    [self enableButtons:NO];
    
    if([self.model gameRound] == 5){
        [self halfTimeOrEnd];
    }else if([self.model gameRound] == 10){
        [self halfTimeOrEnd];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[GameLogicModel alloc] init];
    [self loadLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)halfTimeOrEnd{
    
    self.getQuestion.text = [NSString stringWithFormat:@"Correct answers: %d Wrong answers: %d", self.nrCorrectAnswers, [self.model gameRound] - self.nrCorrectAnswers];
    
    [self hideButtons:YES];
    [self.continueButton setTitle: @"Continue" forState:UIControlStateNormal];
    
    if(([self.model gameRound] == 10)){
    self.nextQuestion.hidden = YES;
    [self hideButtons:YES];
    [self.continueButton setTitle: @"Play again" forState:UIControlStateNormal];
    }
}
- (IBAction)continueQuiz:(UIButton *)sender {
    if(([self.model gameRound] == 5)){
    
        [self hideButtons:NO];
    [self generateQuestion:nil];
   
    }else if(([self.model gameRound] == 10)){
        [self.model newGame];
        [self generateQuestion:nil];
        [self hideButtons:NO];
        self.nrCorrectAnswers = 0;
    }
}

-(void) hideButtons:(BOOL)hideShow{
    if(hideShow){
        self.nextQuestion.hidden = YES;
        self.answ1.hidden = YES;
        self.answ2.hidden = YES;
        self.answ3.hidden = YES;
        self.answ4.hidden = YES;
        self.rightWrong.hidden = YES;
        self.continueButton.hidden = NO;
    }else{
        self.nextQuestion.hidden = NO;
        self.answ1.hidden = NO;
        self.answ2.hidden = NO;
        self.answ3.hidden = NO;
        self.answ4.hidden = NO;
        self.rightWrong.hidden = NO;
        self.nextQuestion.hidden = NO;
        self.continueButton.hidden = YES;
    }
}

-(void) enableButtons:(BOOL)disableEnable{
    if(disableEnable){
        self.answ1.userInteractionEnabled = YES;
        self.answ2.userInteractionEnabled = YES;
        self.answ3.userInteractionEnabled = YES;
        self.answ4.userInteractionEnabled = YES;
        self.nextQuestion.userInteractionEnabled = NO;
        
        self.answ1.layer.backgroundColor = [UIColor blackColor].CGColor;
        self.answ2.layer.backgroundColor = [UIColor blackColor].CGColor;
        self.answ3.layer.backgroundColor = [UIColor blackColor].CGColor;
        self.answ4.layer.backgroundColor = [UIColor blackColor].CGColor;
    }else{
        self.answ1.userInteractionEnabled = NO;
        self.answ2.userInteractionEnabled = NO;
        self.answ3.userInteractionEnabled = NO;
        self.answ4.userInteractionEnabled = NO;
        self.nextQuestion.userInteractionEnabled = YES;
    }
}

-(void) loadLayout{
    self.answ1.layer.cornerRadius = 10;
    self.answ2.layer.cornerRadius = 10;
    self.answ3.layer.cornerRadius = 10;
    self.answ4.layer.cornerRadius = 10;
    self.answ1.layer.borderWidth = 4;
    self.answ1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.answ2.layer.borderWidth = 4;
    self.answ2.layer.borderColor = [UIColor whiteColor].CGColor;
    self.answ3.layer.borderWidth = 4;
    self.answ3.layer.borderColor = [UIColor whiteColor].CGColor;
    self.answ4.layer.borderWidth = 4;
    self.answ4.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.answ2.layer.cornerRadius = 10;
    self.answ3.layer.cornerRadius = 10;
    self.answ4.layer.cornerRadius = 10;
    
    self.continueButton.layer.cornerRadius = 10;
    self.nextQuestion.layer.cornerRadius = 10;
    self.continueButton.hidden = YES;
    [self generateQuestion:nil];
}

@end
