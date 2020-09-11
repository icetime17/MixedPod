//
//  OCObject.m
//  MixedPod
//
//  Created by Chris on 2020/9/10.
//

#import "OCObject.h"
#import <MixedPod/MixedPod-Swift.h>

@implementation OCObject

+ (void)classSay {
    NSLog(@"%@ %s", self, __FUNCTION__);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [SwiftNSObject staticSay];
        SwiftNSObject *swiftNSObj = [[SwiftNSObject alloc] init];
        [swiftNSObj say];
    });
}

- (void)say {
    NSLog(@"%@ %s", self, __FUNCTION__);
    
    [self.delegate aMethodFromOCObjectDelegate];
}

@end
