//
//  DDEventFilterReducer.m
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/15.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import "DDEventFilterReducer.h"

@implementation DDEventFilterStrongReducer

- (instancetype)initWithFilter:(DDEventDispatchFilter)filter reducer:(id<DDEventReducer>)reducer
{
    self = [super init];
    if (self) {
        _filter = filter;
        _reducer = reducer;
    }
    return self;
}

- (void)dispatchEvent:(DDEvent *)event {
    BOOL valid = YES;
    if (_filter) {
        valid = _filter(event);
    }
    if (valid) {
        [_reducer dispatchEvent:event];
    }
}

@end

@implementation DDEventFilterWeakReducer

- (instancetype)initWithFilter:(DDEventDispatchFilter)filter reducer:(id<DDEventReducer>)reducer
{
    self = [super init];
    if (self) {
        _filter = filter;
        _reducer = reducer;
    }
    return self;
}

- (void)dispatchEvent:(DDEvent *)event {
    BOOL valid = YES;
    if (_filter) {
        valid = _filter(event);
    }
    if (valid) {
        [_reducer dispatchEvent:event];
    }
}

@end
