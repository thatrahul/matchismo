//
//  ViewController.m
//  Matchismo
//
//  Created by Rahul Phadnis on 12/8/14.
//  Copyright (c) 2014 Rahul Phadnis. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@end

@implementation CardGameViewController

-(void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d", self.flipCount];
    NSLog(@"Flip count set to:%d", self.flipCount);
}

- (IBAction)cardButtonTouched:(UIButton *)sender {
    
    if ([sender.currentTitle length] == 0) {
        UIImage *cardImage = [UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage:cardImage
                          forState:UIControlStateNormal];
        //clear the previous text.
        [sender setTitle:@"A♣️" forState:UIControlStateNormal];
    } else {
        UIImage *cardImage = [UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage:cardImage
                          forState:UIControlStateNormal];
        //clear the previous text.
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    self.flipCount ++;
}
@end
