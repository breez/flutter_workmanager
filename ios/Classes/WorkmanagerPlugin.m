#import "WorkmanagerPlugin.h"

#if __has_include(<workmanager/workmanager-Swift.h>)
#import <workmanager/workmanager-Swift.h>
#else
#import "workmanager-Swift.h"
#endif

@implementation WorkmanagerPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    [SwiftWorkmanagerPlugin registerWithRegistrar:registrar];
}

+ (void)setPluginRegistrantCallback:(FlutterPluginRegistrantCallback)callback {
    [SwiftWorkmanagerPlugin setPluginRegistrantCallback:callback];
}

+ (void)registerTaskWithIdentifier:(NSString *) taskIdentifier {
    if (@available(iOS 13, *)) {
        [SwiftWorkmanagerPlugin registerBGProcessingTaskWithIdentifier:taskIdentifier];
    }
}

+ (void)registerPeriodicTaskWithIdentifier:(NSString *)taskIdentifier{
    if (@available(iOS 13, *)) {
        [SwiftWorkmanagerPlugin registerAppRefreshTaskWithIdentifier:taskIdentifier];
    }
}

+ (void)registerBGProcessingTaskWithIdentifier:(NSString *) taskIdentifier{
    if (@available(iOS 13, *)) {
        [SwiftWorkmanagerPlugin registerBGProcessingTaskWithIdentifier:taskIdentifier];
    }
}

@end
