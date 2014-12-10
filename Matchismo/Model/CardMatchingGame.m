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
    Card * chosen = [self cardAtIndex:index];
    //only do the logic if the card is not matched.
    if (![chosen isMatched]) {
        
    }
        
}
@end
