//
//  WinningTicketViewController.h
//  Jackpot2
//
//  Created by Allen Spicer on 5/8/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketsTableViewController.h"

@interface WinningTicketViewController : UIViewController

@property (strong, nonatomic) id<WinningTicketViewControllerDelegate> delegate;

@end
