//
//  DDEvent.h
//  DDEventDispatcherExample
//
//  Created by daniel on 2019/1/14.
//  Copyright © 2019 Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDEvent : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) id object;
@property (nonatomic, strong) NSDictionary *userInfo;

@end

NS_ASSUME_NONNULL_END
