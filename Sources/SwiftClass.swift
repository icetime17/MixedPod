//
//  SwiftClass.swift
//  Pods-DemoMixedPod
//
//  Created by Chris on 2020/9/10.
//

public struct SwiftStruct {
    let name: String
    let age: Int
}

public protocol SwiftClassDelegate: class {
    func aMethodFromSwiftClassDelegate()
}

var isTestedSwiftClass = false

public class SwiftClass {
    public weak var delegate: SwiftClassDelegate?
    
    public init() {
        // pod中的swift调用OC，不需要特殊处理。MixedPod-umbrella.h中已经添加了OC头文件。
        
        if !isTestedSwiftClass {
            isTestedSwiftClass = true
            
            OCObject.classSay()
            OCObject().say()
            
            SwiftNSObject.staticSay()
            SwiftNSObject().say()
        }
    }
    
    public static func staticSay() {
        print("\(self).\(#function)")
    }
    
    public func say() {
        print("\(self).\(#function)")
        
        delegate?.aMethodFromSwiftClassDelegate()
    }
}
