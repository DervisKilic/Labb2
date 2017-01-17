//
//  GameLogicModel.m
//  Labb2
//
//  Created by Dervis Kilic on 17/01/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

#import "GameLogicModel.h"

@interface GameLogicModel ()

@property (nonatomic) NSMutableArray *questionsArray1;
@property (nonatomic) NSMutableArray *questionsArray2;
@property (nonatomic) NSMutableArray *questionsArray3;
@property (nonatomic) NSMutableArray *questionsArray4;
@property (nonatomic) NSMutableArray *questionsArray5;
@property (nonatomic) NSMutableArray *questionsArray6;
@property (nonatomic) NSMutableArray *questionsArray7;
@property (nonatomic) NSMutableArray *questionsArray8;
@property (nonatomic) NSMutableArray *questionsArray9;
@property (nonatomic) NSMutableArray *questionsArray10;
@property (nonatomic) NSMutableArray *questions;
@property (nonatomic) NSMutableArray *randomQuestion;

@property (nonatomic) NSString *question;
@property (nonatomic) NSString *answ1;
@property (nonatomic) NSString *answ2;
@property (nonatomic) NSString *answ3;
@property (nonatomic) NSString *answ4;
@property (nonatomic) int round;

@end

@implementation GameLogicModel

-(void) setupData{
    
    if(self.questions == nil){
        self.round = 0;
        self.questionsArray1 =[NSMutableArray arrayWithObjects:@"I vilken stad i Sverige luktar det alltid fisk?", @"Göteborg", @"Flen", @"Malmö", @"Karlstad", nil];
        self.questionsArray2 = [NSMutableArray arrayWithObjects:@"Fråga2", @"svar21", @"svar22", @"svar23", @"svar24",nil];
        self.questionsArray3 = [NSMutableArray arrayWithObjects:@"Fråga3", @"svar31", @"svar32", @"svar33", @"svar34",nil];
        self.questionsArray4 = [NSMutableArray arrayWithObjects:@"Fråga4", @"svar41", @"svar42", @"svar43", @"svar44",nil];
        self.questionsArray5 = [NSMutableArray arrayWithObjects:@"Fråga5", @"svar51", @"svar52", @"svar53", @"svar54",nil];
        self.questionsArray6 = [NSMutableArray arrayWithObjects:@"Fråga6", @"svar61", @"svar62", @"svar63", @"svar64",nil];
        self.questionsArray7 = [NSMutableArray arrayWithObjects:@"Fråga7", @"svar71", @"svar72", @"svar73", @"svar74",nil];
        self.questionsArray8 = [NSMutableArray arrayWithObjects:@"Fråga8", @"svar81", @"svar82", @"svar83", @"svar84",nil];
        self.questionsArray9 = [NSMutableArray arrayWithObjects:@"Fråga9", @"svar91", @"svar92", @"svar93", @"svar94",nil];
        self.questionsArray10 = [NSMutableArray arrayWithObjects:@"Fråga10", @"svar101", @"svar102", @"svar103", @"svar104",nil];
        
        self.questions = [NSMutableArray arrayWithObjects:self.questionsArray1, self.questionsArray2, self.questionsArray3, self.questionsArray4, self.questionsArray5, self.questionsArray6, self.questionsArray7, self.questionsArray8, self.questionsArray9, self.questionsArray10, nil];
    }
    int randomize;
    randomize = arc4random() % self.questions.count;
    
    self.question = self.questions[randomize][0];
    self.answ1 = self.questions[randomize][1];
    self.answ2 = self.questions[randomize][2];
    self.answ3 = self.questions[randomize][3];
    self.answ4 = self.questions[randomize][4];
    
    self.randomQuestion = [NSMutableArray arrayWithObjects:self.question, self.answ1, self.answ2, self.answ3, self.answ4, nil];
    [self.questions removeObjectAtIndex:randomize];
    self.round++;
}
-(NSArray*)getData{
    return self.randomQuestion;
}

-(int)gameRound{
    return self.round;
}

-(void)newGame{
    self.questions = nil;
}

@end
