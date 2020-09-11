//
//  TestInOC.m
//  DemoMixedPod
//
//  Created by Chris on 2020/9/10.
//  Copyright © 2020 icetime. All rights reserved.
//

#import "TestInOC.h"

#import "DemoMixedPod-Swift.h"

// 使用OC对象OCObject单独导入OC头文件。却无法使用SwiftNSObject
//#import <MixedPod/OCObject.h>

// 导入该头文件则可以使用SwiftNSObject，也可以使用OCObject
//#import <MixedPod/MixedPod-umbrella.h>

// 如下单独导入
//#import <MixedPod/MixedPod-Swift.h>
//#import <MixedPod/OCObject.h>

// 或者使用这种方式Modules导入，则SwiftNSObject和OCObject都可以使用。
@import MixedPod;

@interface TestInOC () <
    SwiftNSObjectDelegateSwift, // 这个居然可以？明明是SwiftNSObjectDelegateSwift: class
    SwiftNSObjectDelegateNSObject,
    OCObjectDelegate
>

@end

@implementation TestInOC

+ (void)test {
    [self testSwift];
    [self testOC];
    [self testProtocols];
}

+ (void)testSwift {
    [SwiftNSObject staticSay];
    SwiftNSObject *swiftNSObj = [[SwiftNSObject alloc] init];
    [swiftNSObj say];
    
    [MyOCClass staticSay];
    [[[MyOCClass alloc] init] say];
}

+ (void)testOC {
    [OCObject classSay];
    [[[OCObject alloc] init] say];
}

+ (void)testProtocols {
    TestInOC *testObj = [[TestInOC alloc] init];
    
    SwiftNSObject *swiftNSObj = [[SwiftNSObject alloc] init];
    OCObject *ocObj = [[OCObject alloc] init];
    
    swiftNSObj.delegateSwift = testObj;
    swiftNSObj.delegateNSObject = testObj;
    [swiftNSObj say];
    
    ocObj.delegate = testObj;
    [ocObj say];
}

// MARK: - SwiftNSObjectDelegateSwift

- (void)aMethodFromSwiftNSObjectDelegateSwift {
    
}

// MARK: - SwiftNSObjectDelegateNSObject

- (void)aMethodFromSwiftNSObjectDelegateNSObject {
    
}

// MARK: - OCObjectDelegate

- (void)aMethodFromOCObjectDelegate {
    
}

@end
