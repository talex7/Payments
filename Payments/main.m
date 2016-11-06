//
//  main.m
//  Payments
//
//  Created by Thomas Alexanian on 2016-11-06.
//  Copyright © 2016 Thomas Alexanian. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        int cost = arc4random_uniform(900) + 100;
    
        NSLog (@"Thank you for shopping at Acme.com Your total today is $%d Please select your payment method: 1: Paypal, 2: Stripe, 3: Amazon", cost);
        
        char answer[255];
        
        NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        
        fgets(answer, 256, stdin);
        
        NSString *result = [NSString stringWithCString:answer encoding:NSUTF8StringEncoding];
        
       int choice = [[result stringByTrimmingCharactersInSet:charSet] intValue];
        
        NSLog(@"%d", choice);
        
    }
    return 0;
}
