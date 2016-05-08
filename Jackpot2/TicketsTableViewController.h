//
//  TicketsTableViewController.h
//  Jackpot2
//
//  Created by Allen Spicer on 5/8/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@protocol WinningTicketViewControllerDelegate

- (void)winningTicketWasAdded:(Ticket *)ticket;

@end

@interface TicketsTableViewController : UITableViewController <WinningTicketViewControllerDelegate>

@end