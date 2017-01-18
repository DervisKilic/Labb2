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
        self.questionsArray2 = [NSMutableArray arrayWithObjects:@"Vilken färg var Napoleons vita häst?", @"Vit", @"Svart", @"Blå", @"Grön",nil];
        self.questionsArray3 = [NSMutableArray arrayWithObjects:@"Fem myror är fler än fyra ...?", @"Elefanter", @"Katter", @"Stövlar", @"Burkar",nil];
        self.questionsArray4 = [NSMutableArray arrayWithObjects:@"I vilken miljö trivs fiskar bäst i?", @"Vatten", @"Vakum", @"Soffan", @"Nordstan",nil];
        self.questionsArray5 = [NSMutableArray arrayWithObjects:@"Vad heter Super Marios bror?", @"Luigi", @"Stefan", @"Göran", @"Britt-Marie",nil];
        self.questionsArray6 = [NSMutableArray arrayWithObjects:@"Var bor det flest människor", @"Jorden", @"Solen", @"Varberg", @"Avenyn",nil];
        self.questionsArray7 = [NSMutableArray arrayWithObjects:@"Om klockan är 12:00 vad är den då om 5 minuter?", @"12:05", @"12:02", @"14:48", @"25:32",nil];
        self.questionsArray8 = [NSMutableArray arrayWithObjects:@"Hitta det avvikande svaret", @"Mjukost", @"Groda", @"Hund", @"Lemur",nil];
        self.questionsArray9 = [NSMutableArray arrayWithObjects:@"Vad innehåller inte kött?", @"Hammare", @"Skinka", @"Biff", @"Kött",nil];
        self.questionsArray10 = [NSMutableArray arrayWithObjects:@"Hur många centimeter är 1 meter", @"100", @"2", @"Bulle", @"14,2",nil];
        
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
