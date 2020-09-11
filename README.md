# MixedPod

## 使用场景

1. pod中Swift调用其内部OC：不需要特殊处理。MixedPod-umbrella.h中已经添加了OC头文件。
2. pod中OC调用其内部Swift：#import <MixedPod/MixedPod-Swift.h>即可。
3. 外部Swift调用pod中Swift：正常。import MixedPod即可。
4. 外部Swift调用pod中OC：不需要特殊处理，MixedPod-umbrella.h中已经包含了OC的头文件。
5. 外部OC调用pod中Swift：Modules导入即可。或者单独使用#import <MixedPod/MixedPod-Swift.h>也可以。
6. 外部OC调用pod中OC：单独导入OC头文件#import <MixedPod/OCObject.h>，或者Modules导入，或者单独使用MixedPod-umbrella.h均可以。

## 协议场景

没啥特殊的。一切正常使用即可。

1. 外部OC使用pod中的OC协议
2. 外部OC使用pod中的Swift协议
3. 外部Swift使用pod中的OC协议
4. 外部Swift使用pod中的Swift协议

注意：Swift中的协议需要注意class（给类使用）或NSObjectProtocol（OC对象使用）。

## 疑问

1. DemoMixedPod-Swift.h中包含了项目中所有的可以给OC使用的Swift函数、类、协议等。因此大项目中，该文件会很大，尤其是有一些相关的代码修改，会导致生成该文件耗时且容易出错。为啥不考虑进行拆分？
2. pod中的Swift调用pod中的OC，不需要MixedPod-bridging-header.h也可以。是不是MixedPod-umbrella.h的关系？
