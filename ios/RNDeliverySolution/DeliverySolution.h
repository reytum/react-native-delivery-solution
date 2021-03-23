#import <React/RCTBridgeModule.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <TSLocationManager/TSLocationManager.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTInvalidating.h>

@interface DeliverySolution : NSObject <RCTBridgeModule>
@end

@interface RNDeliverySolution : RCTEventEmitter <RCTInvalidating>

@property (nonatomic, strong) TSLocationManager* locationManager;

@end
