//
//  PaypalPaymentService.m
//  Payments
//
//  Created by Thomas Alexanian on 2016-11-06.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import "PaypalPaymentService.h"

@implementation PaypalPaymentService

-(void)processPaymentAmount:(NSInteger)amount {
    if ([self canProcessPayment]) {
    NSLog (@"\nPayment processed by Paypal in the amount of $%ld", (long)amount);
    } else {
        NSLog(@"Sorry but we were unable to process your payment at this time");
    }
}

-(BOOL)canProcessPayment {
    if (arc4random_uniform(1)) {
        return YES;
    } else {
        return NO;
    }
}

@end
