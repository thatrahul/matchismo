//
//  Card.h
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (NSString *) contents;
- (int) match :(NSArray *) otherCards;


@end
