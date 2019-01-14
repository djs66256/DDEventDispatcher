//
//  DDEventBlockReducer.h
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/15.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDEventDispatcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface DDEventBlockReducerInternal : NSObject <DDEventReducer>

@property (nonatomic, copy) DDEventBlockReducer block;
@property (nonatomic, copy, nullable) DDEventDispatchFilter filter;

- (instancetype)initWithFilter:(nullable DDEventDispatchFilter)filter block:(DDEventBlockReducer)block;

@end

NS_ASSUME_NONNULL_END
