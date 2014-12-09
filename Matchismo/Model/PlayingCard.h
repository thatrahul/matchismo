//
//  PlayingCard.h
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;

// list of valid suits
+ (NSArray *) validSuits;
// max rank value
+ (NSUInteger) maxRank;
@end
