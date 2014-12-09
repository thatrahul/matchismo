//
//  Card.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match :(NSArray *) otherCards {
    int score = 0;
    
    for (Card * otherCard in otherCards) {
        if ([[otherCard contents] isEqualToString:[self contents]]) {
            score = 1;
        }
    }
    return score;
}

- (NSString *) contents {
    return @"some card";
}

@end
