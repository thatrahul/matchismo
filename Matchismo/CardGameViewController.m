//
//  ViewController.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *gameScore;

@end

@implementation CardGameViewController

- (IBAction)cardButtonTouched:(UIButton *)sender {
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject: sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    //update the UI
    [self updateUI];
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger index = [self.cardButtons indexOfObject: cardButton];
        Card *card = [self.game cardAtIndex:index];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    
    }
    self.gameScore.text = [NSString stringWithFormat:@"Score:%d", self.game.score];
}

-(Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (CardMatchingGame *) game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] :[self createDeck]];
    }
    return _game;
}

-(NSString *) titleForCard: (Card*) card {
    return card.isChosen ? card.contents : @"";
}

-(UIImage*) backgroundImageForCard : (Card*) card {
    return[UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
