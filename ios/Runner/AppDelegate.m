#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@import UIKit;
@import Firebase;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  [FIRApp configure];
    
    if (@available(iOS 10.0, *)) {
      [UNUserNotificationCenter currentNotificationCenter].delegate = (id<UNUserNotificationCenterDelegate>) self;
    }
    
    [GeneratedPluginRegistrant registerWithRegistry:self];

 //  [FIRMessaging messaging].delegate = self;

 //  if ([UNUserNotificationCenter class] != nil) {
	//   // iOS 10 or later
	//   // For iOS 10 display notification (sent via APNS)
	//   [UNUserNotificationCenter currentNotificationCenter].delegate = self;
	//   UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert |
	//       UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
	//   [[UNUserNotificationCenter currentNotificationCenter]
	//       requestAuthorizationWithOptions:authOptions
	//       completionHandler:^(BOOL granted, NSError * _Nullable error) {
	//         // ...
	//       }];
	// } else {
	//   // iOS 10 notifications aren't available; fall back to iOS 8-9 notifications.
	//   UIUserNotificationType allNotificationTypes =
	//   (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
	//   UIUserNotificationSettings *settings =
	//   [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
	//   [application registerUserNotificationSettings:settings];
	// }

	// [application registerForRemoteNotifications];AppDelegate.m

	return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
