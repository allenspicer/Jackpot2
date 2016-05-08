//
//  WinningTicketViewController.m
//  Jackpot2
//
//  Created by Allen Spicer on 5/8/16.
//  Copyright © 2016 Allen Spicer. All rights reserved.
//


#import "WinningTicketViewController.h"

@interface WinningTicketViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSNumber *firstNumber;
    NSNumber *secondNumber;
    NSNumber *thirdNumber;
    NSNumber *fourthNumber;
    NSNumber *fifthNumber;
    NSNumber *sixthNumber;
}


- (IBAction)randomWinningTicket;



- (IBAction)checkTicket:(UIButton *)sender;


@end

@implementation WinningTicketViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Winner";
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)randomWinningTicket {
    firstNumber = [NSNumber numberWithUnsignedInteger:(arc4random_uniform(53)+1)];
    secondNumber = [NSNumber numberWithUnsignedInteger:(arc4random_uniform(53)+1)];
    thirdNumber = [NSNumber numberWithUnsignedInteger:(arc4random_uniform(53)+1)];
    fourthNumber = [NSNumber numberWithUnsignedInteger:(arc4random_uniform(53)+1)];
    fifthNumber = [NSNumber numberWithUnsignedInteger:(arc4random_uniform(53)+1)];
    sixthNumber = [NSNumber numberWithUnsignedInteger:(arc4random_uniform(53)+1)];
    
    Ticket *winningTicket = [Ticket ticketUsingArray:@[firstNumber, secondNumber, thirdNumber, fourthNumber, fifthNumber, sixthNumber]];
    
    [self.delegate winningTicketWasAdded:winningTicket];
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[self.pickerView reloadAllComponents];
    
}


- (IBAction)checkTicket:(UIButton *)sender
{
    if ([self allNumbersArePicked])
    {
        Ticket *winningTicket = [Ticket ticketUsingArray:@[firstNumber, secondNumber, thirdNumber, fourthNumber, fifthNumber, sixthNumber]];
        
        [self.delegate winningTicketWasAdded:winningTicket];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
}

#pragma mark - UIPickerView data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 6;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 53;
}

#pragma mark - UIPickerView delegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 20.0f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 40.0f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", (long)row + 1];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            firstNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 1:
            secondNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 2:
            thirdNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 3:
            fourthNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 4:
            fifthNumber = [NSNumber numberWithInteger:row+1];
            break;
        case 5:
            sixthNumber = [NSNumber numberWithInteger:row+1];
            break;
            
        default:
            break;
    }
}

#pragma mark - Private Methods

- (BOOL)allNumbersArePicked
{
    BOOL rc = NO;
    
    if (firstNumber && secondNumber && thirdNumber && fourthNumber && fifthNumber && sixthNumber)
    {
        rc = YES;
    }
    
    return rc;
}

@end
