//
//  DDEventReducer.h
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/14.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDEvent.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DDEventReducer <NSObject>

- (void)dispatchEvent:(DDEvent *)event;

@end

NS_ASSUME_NONNULL_END
