//
//  Deck.h
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void) addCardToDeck: (Card*) card atTop: (BOOL) value;

-(void) addCardToDeck: (Card*) card;

-(Card *) drawRandomCard;
@end
