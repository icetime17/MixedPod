//
//  TestInSwift.swift
//  DemoMixedPod
//
//  Created by Chris on 2020/9/10.
//  Copyright © 2020 icetime. All rights reserved.
//

import Foundation
import MixedPod

// Swift中使用pod中的swift和oc均可以。不需要特殊处理，MixedPod-umbrella.h中已经包含了OC的头文件。
func TestInSwift() {
    testSwift()
    testOC()
    
    testProtocols()
}

func testSwift() {
    SwiftClass.staticSay()
    SwiftClass().say()
    
    SwiftNSObject.staticSay()
    let swiftNSObj = SwiftNSObject()
    swiftNSObj.say()
}

func testOC() {
    OCObject.classSay()
    OCObject().say()
}

func testProtocols() {
    let myObj = MySwiftClass()
    let myOCObj = MyOCClass()
    
    let swiftObj = SwiftClass()
    let swiftNSObj = SwiftNSObject()
    let ocObj = OCObject()
    
    swiftObj.delegate = myObj
    swiftNSObj.delegateSwift = myObj
    swiftNSObj.delegateNSObject = myOCObj
    ocObj.delegate = myOCObj
    
    swiftObj.say()
    swiftNSObj.say()
    ocObj.say()
}


class MySwiftClass {
    
}

extension MySwiftClass: SwiftClassDelegate {
    func aMethodFromSwiftClassDelegate() {
        
    }
}

extension MySwiftClass: SwiftNSObjectDelegateSwift {
    func aMethodFromSwiftNSObjectDelegateSwift() {
        
    }
}


class MyOCClass: NSObject {
    @objc
    static func staticSay() {
        print("\(self).\(#function)")
    }
    
    @objc
    func say() {
        print("\(self).\(#function)")
    }
}

extension MyOCClass: OCObjectDelegate {
    func aMethodFromOCObjectDelegate() {
        
    }
}

extension MyOCClass: SwiftNSObjectDelegateNSObject {
    func aMethodFromSwiftNSObjectDelegateNSObject() {
        
    }
}
