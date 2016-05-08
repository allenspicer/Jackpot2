//
//  Ticket.h
//  Jackpot2
//
//  Created by Allen Spicer on 5/8/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (assign) BOOL winner;
@property (strong, nonatomic) NSString *payout;
@property (nonatomic) NSInteger *payoutTotal;

+ (instancetype)ticketUsingQuickPick;
+ (instancetype)ticketUsingArray:(NSArray *)picks;

- (void)compareWithTicket:(Ticket *)anotherTicket;

- (NSArray *)picks;

@end