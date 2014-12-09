//
//  Deck.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (nonatomic, strong) NSMutableArray *cards;

@end
@implementation Deck

-(NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) addCardToDeck: (Card*) card atTop: (BOOL) atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(void) addCardToDeck: (Card*) card {
    [self addCardToDeck:card atTop:NO];
}

-(Card *) drawRandomCard {
    Card * randomCard = nil;
    if ([self.cards count]) {
        NSInteger index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        //remove the card from the list
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}


@end
