//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Rahul Phadnis on 12/9/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic, readonly) NSInteger score;

//designated initializer. Comment only not
//enforced by the compiler
- (instancetype) initWithCardCount: (NSUInteger) cardCount : (Deck*) cardDeck;

- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex : (NSUInteger) index;
@end
