//
//  DDEventDispatcher.m
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/14.
//  Copyright © 2019 Daniel. All rights reserved.
//

#include <mutex>
#import "DDEventDispatcher.h"
#import "DDEventFilterReducer.h"
#import "DDeventBlockReducer.h"

@interface DDEventDispatcher () {
    std::mutex _reducerLock;
    NSMutableArray<id<DDEventReducer>> *_reducers;
}

@end

@implementation DDEventDispatcher

- (void)dispatchEvent:(DDEvent *)event {
    NSArray<id<DDEventReducer>> *reducers = ({
        std::lock_guard<std::mutex> l(_reducerLock);
        _reducers.copy;
    });
    for (id<DDEventReducer> reducer in reducers) {
        [reducer dispatchEvent:event];
    }
}

- (void)addReducerBlock:(DDEventBlockReducer)block {
    if (block) {
    auto r = [[DDEventBlockReducerInternal alloc] initWithFilter:NULL block:block];
    std::lock_guard<std::mutex> l(_reducerLock);
    [_reducers addObject:r];
    }
}

- (void)addFilter:(DDEventDispatchFilter)filter reducerBlock:(DDEventBlockReducer)block {
    if (block) {
    auto r = [[DDEventBlockReducerInternal alloc] initWithFilter:filter block:block];
    std::lock_guard<std::mutex> l(_reducerLock);
    [_reducers addObject:r];
    }
}

- (void)addStrongReducer:(id<DDEventReducer>)reducer {
    if (reducer) {
        std::lock_guard<std::mutex> l(_reducerLock);
        [_reducers addObject:reducer];
    }
}

- (void)addWeakReducer:(id<DDEventReducer>)reducer {
    if (reducer) {
        auto r = [[DDEventFilterWeakReducer alloc] initWithFilter:NULL reducer:reducer];
        std::lock_guard<std::mutex> l(_reducerLock);
        [_reducers addObject:r];
    }
}

- (void)addFilter:(DDEventDispatchFilter)filter strongReducer:(nonnull id<DDEventReducer>)reducer {
    if (reducer) {
        auto r = [[DDEventFilterStrongReducer alloc] initWithFilter:NULL reducer:reducer];
        std::lock_guard<std::mutex> l(_reducerLock);
        [_reducers addObject:r];
    }
}

- (void)addFilter:(DDEventDispatchFilter)filter weakReducer:(nonnull id<DDEventReducer>)reducer {
    if (reducer) {
        auto r = [[DDEventFilterWeakReducer alloc] initWithFilter:NULL reducer:reducer];
        std::lock_guard<std::mutex> l(_reducerLock);
        [_reducers addObject:r];
    }
}

- (void)addFilter:(DDEventDispatchFilter)filter childDispatcher:(DDEventDispatcher *)dispatcher {
    [self addFilter:filter strongReducer:dispatcher];
}

@end
