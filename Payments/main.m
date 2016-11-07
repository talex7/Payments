//
//  main.m
//  Payments
//
//  Created by Thomas Alexanian on 2016-11-06.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        PaymentGateway *paymentGateway = [PaymentGateway new];
        
        char answer[255];
        int cost = arc4random_uniform(900) + 100;
        NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        NSLog (@"\nThank you for shopping at Acme.com \nYour total today is $%d \nPlease select your payment method: \n1: Paypal, 2: Stripe, 3: Amazon", cost);
        
    
        fgets(answer, 256, stdin);
        
        NSString *result = [NSString stringWithCString:answer encoding:NSUTF8StringEncoding];
        int choice = [[result stringByTrimmingCharactersInSet:charSet] intValue];
        
        NSLog(@"Input: %d", choice);
        
        id<PaymentDelegate> delegate;
        
        switch (choice) {
            case 1:
                delegate = [PaypalPaymentService new];
                paymentGateway.paymentDelegate = delegate;
                [paymentGateway processPaymentAmount:cost];
                break;
            case 2:
                delegate = [StripePaymentService new];
                paymentGateway.paymentDelegate = delegate;
                [paymentGateway processPaymentAmount:cost];
                break;
            case 3:
                delegate = [AmazonPaymentService new];
                paymentGateway.paymentDelegate = delegate;
                [paymentGateway processPaymentAmount:cost];
                break;
            default:
                break;
        }
        
        
    }
    return 0;
}
