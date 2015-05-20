//
//  InterfaceController.m
//  HttpWeather WatchKit Extension
//
//  Created by Amir Ghoreshi on 20/05/15.
//  Copyright (c) 2015 AM. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *weatherLabel;

@end


@implementation InterfaceController

@synthesize weatherLabel;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}
- (IBAction)updateWeather {

    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Oslo,uk"]];
    NSURLResponse *response = nil;
    NSError *error = nil;

    NSData *dataWeather = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];

    NSString *myData = [[NSString alloc] initWithData:dataWeather encoding:NSASCIIStringEncoding];
    NSLog(@"%@", myData);
    if (error == nil) {

    }
    NSMutableDictionary *allData = [NSJSONSerialization JSONObjectWithData:dataWeather options:NSJSONReadingMutableContainers error:&error];

    NSString *currentWeather = nil;
    NSArray *weather = allData[@"weather"];
    for (NSDictionary *theWeather in weather) {
        currentWeather = theWeather[@"main"];
    }
    [weatherLabel setText:currentWeather];
    NSLog(@"%@", currentWeather);
    if (error == nil) {

    }
}

@end