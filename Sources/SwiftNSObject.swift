//
//  SwiftNSObject.swift
//  Pods-DemoMixedPod
//
//  Created by Chris on 2020/9/10.
//

@objc
public protocol SwiftNSObjectDelegateSwift: class {
    func aMethodFromSwiftNSObjectDelegateSwift()
}

@objc
public protocol SwiftNSObjectDelegateNSObject: NSObjectProtocol {
    func aMethodFromSwiftNSObjectDelegateNSObject()
}

var isTestedSwiftNSObject = false

public class SwiftNSObject: NSObject {
    @objc
    public weak var delegateSwift: SwiftNSObjectDelegateSwift?
    @objc
    public weak var delegateNSObject: SwiftNSObjectDelegateNSObject?
    
    @objc
    public override init() {
        super.init()
        
        // pod中的swift调用OC，不需要特殊处理。MixedPod-umbrella.h中已经添加了OC头文件。
        if !isTestedSwiftClass {
            isTestedSwiftClass = true
            
            OCObject.classSay()
            OCObject().say()
        }
    }
    
    @objc
    public static func staticSay() {
        print("\(self).\(#function)")
    }
    
    @objc
    public func say() {
        print("\(self).\(#function)")
        
        delegateSwift?.aMethodFromSwiftNSObjectDelegateSwift()
        delegateNSObject?.aMethodFromSwiftNSObjectDelegateNSObject()
    }
}
