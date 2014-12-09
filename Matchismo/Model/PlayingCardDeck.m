//
//  PlayCardDeck.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/9/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
-(instancetype) init {
    self = [super init];
    if (self) {
        for (NSString* suit in [PlayingCard validSuits]) {
            for (int rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard * card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCardToDeck:card];
            }
        }
    }
    return self;
}
@end
