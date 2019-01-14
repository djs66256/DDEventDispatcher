//
//  DDEventBlockReducer.m
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/15.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import "DDEventBlockReducer.h"

@implementation DDEventBlockReducerInternal

- (instancetype)initWithFilter:(DDEventDispatchFilter)filter block:(DDEventBlockReducer)block
{
    self = [super init];
    if (self) {
        _filter = filter;
        _block = block;
    }
    return self;
}

- (void)dispatchEvent:(DDEvent *)event {
    BOOL valid = YES;
    if (_filter) {
        valid = _filter(event);
    }
    if (valid) {
        if (_block) {
            _block(event);
        }
    }
}

@end
