//
//  YDQuotaInfo.h
//  sdk
//
//  Created by Alexander Shvetsov on 2/28/14.
//  Copyright (c) 2014 Yandex. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YDSession;

@interface YDQuotaInfo : NSObject

@property (nonatomic, weak, readonly) YDSession *session;
@property (nonatomic, readonly) long long availableBytes;
@property (nonatomic, readonly) long long usedBytes;
@property (nonatomic, readonly) long long totalBytes;

- (instancetype)initWithSession:(YDSession *)session
                     dictionary:(NSDictionary *)properties
                            URL:(NSURL *)url;

@end
