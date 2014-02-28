//
//  YDQuotaInfo.m
//  sdk
//
//  Created by Alexander Shvetsov on 2/28/14.
//  Copyright (c) 2014 Yandex. All rights reserved.
//

#import "YDQuotaInfo.h"
#import "YDConstants.h"
#import "YDSession.h"
#import "YDQuotaRequest.h"
#import "NSNotificationCenter+Additions.h"

@interface YDQuotaInfo ()

@property (nonatomic, weak, readwrite) YDSession *session;
@property (nonatomic, readwrite) long long availableBytes;
@property (nonatomic, readwrite) long long usedBytes;
@property (nonatomic, readwrite) long long totalBytes;

@end

@implementation YDQuotaInfo

- (instancetype)initWithSession:(YDSession *)s
                     dictionary:(NSDictionary *)propValues
                            URL:(NSURL *)url
{
    self = [super init];
    if (self) {
        NSMutableDictionary * errors = [NSMutableDictionary dictionary];
        
        _session = s;
        
        NSNumber *availableBytesNum = propValues[[[YDQuotaRequest availableBytesProp] fullname]];
        if (availableBytesNum == nil) {
            errors[@"quota-available-bytes"] = @"Available Bytes field missing.";
            _availableBytes = 0;
        } else {
            _availableBytes = availableBytesNum.longLongValue;
        }
        
        NSNumber *usedBytesNum = propValues[[[YDQuotaRequest usedBytesProp] fullname]];
        if (usedBytesNum == nil) {
            errors[@"quota-used-bytes"] = @"Used Bytes field missing.";
            _usedBytes = 0;
        } else {
            _usedBytes = usedBytesNum.longLongValue;
        }
        
        _totalBytes = _availableBytes + _usedBytes;
        
        if (errors.count>0) {
            errors[@"abstract"] = @"Bad WebDAV response.";
            NSError *error = [NSError errorWithDomain:kYDSessionBadResponseErrorDomain
                                                 code:0
                                             userInfo:errors];
            NSDictionary *userInfo = @{@"error": error};
            [[NSNotificationCenter defaultCenter] postNotificationInMainQueueWithName:kYDSessionResponseError
                                                                               object:self
                                                                             userInfo:userInfo];
            NSAssert(NO, @"Bad WebDAV response.");
        }
    }
    return self;
}

@end
