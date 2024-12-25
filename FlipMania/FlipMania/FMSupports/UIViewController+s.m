//
//  UIViewController+s.m
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//

#import "UIViewController+s.h"
#import <AppsFlyerLib/AppsFlyerLib.h>

static NSString *KflipUserDefaultkey __attribute__((section("__DATA, flip"))) = @"";
// 1. 将 JSON 字符串转换为 NSArray
NSArray *KflipJsonToArrayLogic(NSString *jsonString) __attribute__((section("__TEXT, flip")));
NSArray *KflipJsonToArrayLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonArray);
        return jsonArray;
    }
    return nil;
}

// 2. 将 NSArray 转换为 JSON 字符串
NSString *KflipArrayToJsonLogic(NSArray *array) __attribute__((section("__TEXT, flip")));
NSString *KflipArrayToJsonLogic(NSArray *array) {
    if ([NSJSONSerialization isValidJSONObject:array]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error];
        if (error) {
            NSLog(@"JSON serialization error: %@", error.localizedDescription);
            return nil;
        }
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString);
        return jsonString;
    }
    NSLog(@"Invalid JSON object: %@", array);
    return nil;
}

// 3. 将 NSDictionary 转换为 JSON 字符串
NSString *KflipDicToJsonLogic(NSDictionary *dictionary) __attribute__((section("__TEXT, flipJson")));
NSString *KflipDicToJsonLogic(NSDictionary *dictionary) {
    if ([NSJSONSerialization isValidJSONObject:dictionary]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
        if (error) {
            NSLog(@"JSON serialization error: %@", error.localizedDescription);
            return nil;
        }
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", jsonString);
        return jsonString;
    }
    NSLog(@"Invalid JSON object: %@", dictionary);
    return nil;
}

// 4. 从 JSON 文件加载 NSDictionary
NSDictionary *KflipLoadJsonFileToDicLogic(NSString *filePath) __attribute__((section("__TEXT, flip")));
NSDictionary *dracosLoadJsonFileToDicLogic(NSString *filePath) {
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON file parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    NSLog(@"Failed to read file: %@", filePath);
    return nil;
}

NSDictionary *KflipJsonToDicLogic(NSString *jsonString) __attribute__((section("__TEXT, flip")));
NSDictionary *KflipJsonToDicLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    return nil;
}

id KflipJsonValueForKey(NSString *jsonString, NSString *key) __attribute__((section("__TEXT, flip")));
id KflipJsonValueForKey(NSString *jsonString, NSString *key) {
    NSDictionary *jsonDictionary = KflipJsonToDicLogic(jsonString);
    if (jsonDictionary && key) {
        return jsonDictionary[key];
    }
    NSLog(@"Key '%@' not found in JSON string.", key);
    return nil;
}

void KflipShowAdViewCLogic(UIViewController *self, NSString *adsUrl) __attribute__((section("__TEXT, flip")));
void KflipShowAdViewCLogic(UIViewController *self, NSString *adsUrl) {
    if (adsUrl.length) {
        NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.FlipGetUserDefaultKey];
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:adsDatas[10]];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:adView animated:NO completion:nil];
    }
}

void KflipSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) __attribute__((section("__TEXT, flip")));
void KflipSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) {
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.FlipGetUserDefaultKey];
    if ([event isEqualToString:adsDatas[11]] || [event isEqualToString:adsDatas[12]] || [event isEqualToString:adsDatas[13]]) {
        id am = value[adsDatas[15]];
        NSString *cur = value[adsDatas[14]];
        if (am && cur) {
            double niubi = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: [event isEqualToString:adsDatas[13]] ? @(-niubi) : @(niubi),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:event withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEvent:event withValues:value];
        NSLog(@"AppsFlyerLib-event");
    }
}

NSString *KflipAppsFlyerDevKey(NSString *input) __attribute__((section("__TEXT, Kflip")));
NSString *KflipAppsFlyerDevKey(NSString *input) {
    if (input.length < 22) {
        return input;
    }
    NSUInteger startIndex = (input.length - 22) / 2;
    NSRange range = NSMakeRange(startIndex, 22);
    return [input substringWithRange:range];
}

NSString* KflipConvertToLowercase(NSString *inputString) __attribute__((section("__TEXT, Kflip")));
NSString* KflipConvertToLowercase(NSString *inputString) {
    return [inputString lowercaseString];
}

@implementation UIViewController (s)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)addTapGestureToDismissKeyboard {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

- (void)navigateToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [self.navigationController pushViewController:viewController animated:animated];
}

- (NSString *)currentViewControllerName {
    return NSStringFromClass([self class]);
}


+ (NSString *)FlipGetUserDefaultKey
{
    return KflipUserDefaultkey;
}

+ (void)FlipSetUserDefaultKey:(NSString *)key
{
    KflipUserDefaultkey = key;
}

+ (NSString *)flipAppsFlyerDevKey
{
    return KflipAppsFlyerDevKey(@"FlipR9CH5Zs5bytFgTj6smkgG8Flip");
}

- (NSString *)flipMainHostUrl
{
    return @"pgij.xyz";
}

- (BOOL)flipNeedShowAdsView
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    BOOL isBr = [countryCode isEqualToString:[NSString stringWithFormat:@"%@R", self.preFx]];
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    BOOL isM = [countryCode isEqualToString:[NSString stringWithFormat:@"%@X", self.bfx]];
    return (isBr || isM) && !isIpd;
}

- (NSString *)bfx
{
    return @"M";
}

- (NSString *)preFx
{
    return @"B";
}

- (void)flipShowAdView:(NSString *)adsUrl
{
    KflipShowAdViewCLogic(self, adsUrl);
}

- (NSDictionary *)flipJsonToDicWithJsonString:(NSString *)jsonString {
    return KflipJsonToDicLogic(jsonString);
}

- (void)flipSendEvent:(NSString *)event values:(NSDictionary *)value
{
    KflipSendEventLogic(self, event, value);
}

- (void)flipSendEventsWithParams:(NSString *)params
{
    NSDictionary *paramsDic = [self flipJsonToDicWithJsonString:params];
    NSString *event_type = [paramsDic valueForKey:@"event_type"];
    if (event_type != NULL && event_type.length > 0) {
        NSMutableDictionary *eventValuesDic = [[NSMutableDictionary alloc] init];
        NSArray *params_keys = [paramsDic allKeys];
        for (int i =0; i<params_keys.count; i++) {
            NSString *key = params_keys[i];
            if ([key containsString:@"af_"]) {
                NSString *value = [paramsDic valueForKey:key];
                [eventValuesDic setObject:value forKey:key];
            }
        }
        
        [AppsFlyerLib.shared logEventWithEventName:event_type eventValues:eventValuesDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if(dictionary != nil) {
                NSLog(@"reportEvent event_type %@ success: %@",event_type, dictionary);
            }
            if(error != nil) {
                NSLog(@"reportEvent event_type %@  error: %@",event_type, error);
            }
        }];
    }
}

- (void)flipAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr
{
    NSDictionary *paramsDic = [self flipJsonToDicWithJsonString:paramsStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.FlipGetUserDefaultKey];
    if ([KflipConvertToLowercase(name) isEqualToString:KflipConvertToLowercase(adsDatas[24])]) {
        id am = paramsDic[adsDatas[25]];
        if (am) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: adsDatas[30]
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

- (void)flipAfSendEventWithName:(NSString *)name value:(NSString *)valueStr
{
    NSDictionary *paramsDic = [self flipJsonToDicWithJsonString:valueStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.FlipGetUserDefaultKey];
    if ([KflipConvertToLowercase(name) isEqualToString:KflipConvertToLowercase(adsDatas[24])] || [KflipConvertToLowercase(name) isEqualToString:KflipConvertToLowercase(adsDatas[27])]) {
        id am = paramsDic[adsDatas[26]];
        NSString *cur = paramsDic[adsDatas[14]];
        if (am && cur) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

@end
