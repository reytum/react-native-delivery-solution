#import "DeliverySolution.h"
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@implementation DeliverySolution

RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @([a floatValue] * [b floatValue]);

  resolve(result);
}

RCT_REMAP_METHOD(init,
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    // Get a reference to the SDK
    TSLocationManager *bgGeo = [TSLocationManager sharedInstance];
    TSConfig *config = [TSConfig sharedInstance];

    // Provide a reference to your viewController.
    bgGeo.viewController = self;

    [config updateWithBlock:^(TSConfigBuilder *builder) {
        builder.debug = YES;
        builder.logLevel = tsLogLevelVerbose;
        builder.desiredAccuracy = kCLLocationAccuracyBest;
        builder.distanceFilter = 10;
        builder.stopOnTerminate = NO;
        builder.startOnBoot = YES;
        builder.url = @"http://your.server.com/locations";
    }];

    // Listen to events.
    [bgGeo onLocation:^(TSLocation *location) {
        NSLog(@"[location] %@", [location toDictionary]);
    } failure:^(NSError *error) {
        NSLog(@"[location] error %@", @(error.code));
    }];

    // Signal #ready to the plugin.
    [bgGeo ready];

    if (!config.enabled) {
        // Start tracking immediately (if not already).
        [bgGeo start];
    }
  resolve(@"Launch Success");
}

@end
