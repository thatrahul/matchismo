//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/9/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic) NSMutableArray * cards; //of cards
@end

@implementation CardMatchingGame

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
-(NSMutableArray *) cards {
    if (_cards == nil) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype) initWithCardCount: (NSUInteger) cardCount : (Deck *) cardDeck {
    self = [super init];
    if (self) {
        for (int i=0 ; i < cardCount ; i++) {
            Card * card = [cardDeck drawRandomCard];
            if (card) {
                [[self cards] addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *) cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? [self.cards objectAtIndex:index] : nil;
}

- (void) chooseCardAtIndex: (NSUInteger) index {
    Card * selectedCard = [self cardAtIndex:index];
    //only do the logic if the card is not matched.
    if (!selectedCard.isMatched) {
        if (selectedCard.isChosen) {
            selectedCard.chosen = NO;
        } else {
            //match against other cards in the game
            
            for (Card * other in self.cards) {
                if (other.isChosen && !other.isMatched) {
                    int matchScore = [selectedCard match:@[other]];
                    if (matchScore > 0) {
                        self.score += matchScore * MATCH_BONUS;
                        selectedCard.matched = YES;
                        other.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        other.chosen = NO;
                    }
                    break; //we can only choose two cards at a time
                }
            }
            selectedCard.chosen = YES;
            self.score -= COST_TO_CHOOSE;
        }
        
    }
        
}
@end
