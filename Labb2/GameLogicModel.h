//
//  GameLogicModel.h
//  Labb2
//
//  Created by Dervis Kilic on 17/01/17.
//  Copyright © 2017 Dervis Kilic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameLogicModel : NSObject
@property (nonatomic) NSString *correctAnswer;
-(void)setupData;
-(int)gameRound;
-(void)newGame;
-(NSMutableArray*)getQuestion;

@end
