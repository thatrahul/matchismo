//
//  PlayingCard.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *) validSuits {
   return @[@"♠️", @"♥️", @"♣️", @"♦️"];
}

- (void) setSuit:(NSString *) suit {
    if ([[PlayingCard validSuits]containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *) suit {
    return  (_suit) ? _suit : @"?";
}

- (NSString *) contents {
    NSArray * ranks = [PlayingCard rankStrings];
    return [ranks[self.rank] stringByAppendingString :self.suit];
}

+(NSArray*) rankStrings {
    return @[@"?", @"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank {
    return [[PlayingCard rankStrings] count]-1;
}

- (void) setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

//overridden match algorithm
-(int) match:(NSArray *)otherCards {
    int score = 0;
    if ([otherCards count] ==1) {
        PlayingCard * other = [otherCards firstObject];
        if (self.rank == other.rank) {
            score = 4;
        } else if ([self.suit isEqualToString: other.suit]) {
            score = 1;
        }
    }
    
    return score;
}

@end
