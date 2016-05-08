//
//  Ticket.m
//  Jackpot2
//
//  Created by Allen Spicer on 5/8/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//


#import "Ticket.h"

@interface Ticket ()
{
    NSMutableArray *picks;
}

@end

@implementation Ticket

+ (instancetype)ticketUsingQuickPick
{
    Ticket *aTicket = [[Ticket alloc] init];
    for (int i = 0; i < 6; i++)
    {
        [aTicket createPick];
    }
    return aTicket;
}

+ (instancetype)ticketUsingArray:(NSArray *)specificPicks
{
    Ticket *aTicket = [[Ticket alloc] init];
    [aTicket insertPicksUsingArray:specificPicks];
    return aTicket;
}

- (instancetype)init
{
    if (self = [super init])
    {
        picks = [[NSMutableArray alloc] init];
        _winner = NO;
        _payout = @"";
        _payoutTotal = 0;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@  %@  %@  %@  %@  %@", picks[0], picks[1], picks[2], picks[3], picks[4], picks[5]];
}

- (NSArray *)picks
{
    return [picks copy];
}

- (void)createPick
{
    BOOL shouldAddPick = YES;
    do
    {
        int pickInt = arc4random() % 53 + 1;
        NSNumber *pickAsNumber = [NSNumber numberWithInt:pickInt];
        for (NSNumber *aPick in picks)
        {
            if ([pickAsNumber isEqualToNumber:aPick])
            {
                shouldAddPick = NO;
                break;
            }
            else
            {
                shouldAddPick = YES;
            }
        }
        if (shouldAddPick)
        {
            [picks addObject:pickAsNumber];
        }
    } while (!shouldAddPick);
    
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [picks sortUsingDescriptors:@[lowestToHighest]];
}

- (void)insertPicksUsingArray:(NSArray *)specificPicks
{
    picks = [specificPicks mutableCopy];
}

- (void)compareWithTicket:(Ticket *)anotherTicket
{
    NSArray *possibleWinningNumbers = [anotherTicket picks];
    int matchCount = 0;
    
    for (int i = 0; i < [picks count]; i++)
    {
        for (int j = 0; j < [possibleWinningNumbers count]; j++)
        {
            if ([picks[i] isEqualToNumber:possibleWinningNumbers[j]])
            {
                matchCount++;
                break;
            }
        }
    }
    
    switch (matchCount)
    {
        case 1:
            [self setWinner:YES];
            [self setPayout:@"1"];
            [self setPayoutTotal: _payoutTotal+1];
            break;
        case 2:
            [self setWinner:YES];
            [self setPayout:@"5"];
            [self setPayoutTotal: _payoutTotal+5];
            break;
        case 3:
            [self setWinner:YES];
            [self setPayout:@"20"];
            [self setPayoutTotal: _payoutTotal+20];
            break;
        case 4:
            [self setWinner:YES];
            [self setPayout:@"100"];
            [self setPayoutTotal: _payoutTotal+100];
            break;
            
        default:
            break;
    }
}

@end