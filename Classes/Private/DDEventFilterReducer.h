//
//  DDEventFilterReducer.h
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/15.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDEventDispatcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface DDEventFilterStrongReducer : NSObject <DDEventReducer>

@property (nonatomic, strong) id<DDEventReducer> reducer;
@property (nonatomic, copy, nullable) DDEventDispatchFilter filter;

- (instancetype)initWithFilter:(nullable DDEventDispatchFilter)filter reducer:(id<DDEventReducer>)reducer;

@end

@interface DDEventFilterWeakReducer : NSObject <DDEventReducer>

@property (nonatomic, weak) id<DDEventReducer> reducer;
@property (nonatomic, copy) DDEventDispatchFilter filter;

- (instancetype)initWithFilter:(nullable DDEventDispatchFilter)filter reducer:(id<DDEventReducer>)reducer;

@end

NS_ASSUME_NONNULL_END
