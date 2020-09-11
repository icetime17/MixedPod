//
//  OCObject.h
//  MixedPod
//
//  Created by Chris on 2020/9/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OCObjectDelegate <NSObject>

- (void)aMethodFromOCObjectDelegate;

@end

@interface OCObject : NSObject

@property (nonatomic, weak) id<OCObjectDelegate> delegate;

+ (void)classSay;
- (void)say;

@end

NS_ASSUME_NONNULL_END
