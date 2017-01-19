//
//  GameLogicModel.m
//  Labb2
//
//  Created by Dervis Kilic on 17/01/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

#import "GameLogicModel.h"

@interface GameLogicModel ()

@property (nonatomic) NSDictionary *questionsDictionary;
@property (nonatomic) int round;
@property (nonatomic) int randomGenerator;
@property (nonatomic) NSMutableArray *dictionaryValues;
@property (nonatomic) NSArray *question;
@property (nonatomic) NSMutableArray *randomizedQuestion;

@end

@implementation GameLogicModel

-(NSMutableArray*)getQuestion{
    return self.randomizedQuestion;
}

-(int)gameRound{
    return self.round;
}

-(void)newGame{
    self.questionsDictionary = nil;
}
-(void)setupData{

    if(self.questionsDictionary == nil){
        self.round = 0;
        self.questionsDictionary = @{@"q1": @[@"I vilken stad luktar det alltid fisk?", @"Göteborg", @"Flen", @"Malmö", @"Kalix"],
                             @"q2": @[@"Vilken färg var Napoleons vita häst?", @"Vit", @"Svart", @"Blå", @"Grön"],
                             @"q3": @[@"Fem myror är fler än fyra ...?", @"Elefanter", @"Katter", @"Stövlar", @"Burkar"],
                             @"q4": @[@"I vilken miljö trivs fiskar bäst i?", @"Vatten", @"Vakum", @"Soffan", @"Nordstan"],
                             @"q5": @[@"Vad heter Super Marios bror?", @"Luigi", @"Stefan", @"Göran", @"Britt-Marie"],
                             @"q6": @[@"Var bor det flest människor?", @"Jorden",@"Solen", @"Varberg", @"Avenyn"],
                             @"q7": @[@"Om klockan är 12:00 vad är den då om 5 minuter?",@"12:05", @"12:02", @"14:48", @"25:32"],
                             @"q8": @[@"Hitta det avvikande svaret?", @"Mjukost", @"Groda", @"Hund", @"Lemur"],
                             @"q9": @[@"Vad innehåller inte kött?", @"Hammare", @"Skinka", @"Biff", @"Kött"],
                             @"q10": @[@"Hur många centimeter är 1 meter?",  @"100", @"2", @"Bulle", @"14,2"]
                            };

    self.dictionaryValues = [NSMutableArray arrayWithArray:[self.questionsDictionary allValues]];
    }
    
    self.randomGenerator = arc4random() % (self.dictionaryValues.count);
    self.question = [self.dictionaryValues objectAtIndex:self.randomGenerator];
    [self.dictionaryValues removeObjectAtIndex:self.randomGenerator];
    

    self.randomizedQuestion = [[self.question mutableCopy] init];
    [self.randomizedQuestion removeObjectAtIndex:0];
    self.correctAnswer = [self.randomizedQuestion objectAtIndex:0];
    
    
    
    for (NSUInteger i = [self.randomizedQuestion count]; i > 1; i--) [self.randomizedQuestion exchangeObjectAtIndex:i - 1 withObjectAtIndex:arc4random_uniform((u_int32_t)i)];
    
    [self.randomizedQuestion insertObject:self.question[0] atIndex:0];
    
    self.round++;

}

@end
