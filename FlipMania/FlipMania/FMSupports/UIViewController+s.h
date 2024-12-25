//
//  UIViewController+s.h
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (s)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message ;

- (void)addTapGestureToDismissKeyboard ;

- (void)dismissKeyboard ;

- (void)navigateToViewController:(UIViewController *)viewController animated:(BOOL)animated ;

- (NSString *)currentViewControllerName;

+ (NSString *)FlipGetUserDefaultKey;

+ (void)FlipSetUserDefaultKey:(NSString *)key;

- (void)flipSendEvent:(NSString *)event values:(NSDictionary *)value;

+ (NSString *)flipAppsFlyerDevKey;

- (NSString *)flipMainHostUrl;

- (BOOL)flipNeedShowAdsView;

- (void)flipShowAdView:(NSString *)adsUrl;

- (void)flipSendEventsWithParams:(NSString *)params;

- (NSDictionary *)flipJsonToDicWithJsonString:(NSString *)jsonString;

- (void)flipAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr;

- (void)flipAfSendEventWithName:(NSString *)name value:(NSString *)valueStr;
@end

NS_ASSUME_NONNULL_END
