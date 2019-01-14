//
//  DDEventDispatcher.h
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/14.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDEvent.h"
#import "DDEventReducer.h"

NS_ASSUME_NONNULL_BEGIN

typedef BOOL(^DDEventDispatchFilter)(DDEvent *event);
typedef void(^DDEventBlockReducer)(DDEvent *event);

@interface DDEventDispatcher : NSObject <DDEventReducer>

- (void)dispatchEvent:(DDEvent *)event;

- (void)addReducerBlock:(DDEventBlockReducer)block;
- (void)addFilter:(DDEventDispatchFilter)filter reducerBlock:(DDEventBlockReducer)block;

- (void)addStrongReducer:(id<DDEventReducer>)reducer;
- (void)addWeakReducer:(id<DDEventReducer>)reducer;
- (void)addFilter:(DDEventDispatchFilter)filter strongReducer:(id<DDEventReducer>)reducer;
- (void)addFilter:(DDEventDispatchFilter)filter weakReducer:(id<DDEventReducer>)reducer;

- (void)addFilter:(DDEventDispatchFilter)filter childDispatcher:(DDEventDispatcher *)dispatcher;

@end

NS_ASSUME_NONNULL_END
