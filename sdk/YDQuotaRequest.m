//
//  YDQuotaRequest.m
//  sdk
//
//  Created by Alexander Shvetsov on 2/28/14.
//  Copyright (c) 2014 Yandex. All rights reserved.
//

#import "YDQuotaRequest.h"

@implementation YDQuotaRequest

#pragma mark - Default Props

+ (YDLongLongProp *)availableBytesProp
{
    return [YDLongLongProp propWithName:@"quota-available-bytes" xmlns:YDWebDAVDefaultDAVXMLNamespace()];
}

+ (YDLongLongProp *)usedBytesProp
{
    return [YDLongLongProp propWithName:@"quota-used-bytes" xmlns:YDWebDAVDefaultDAVXMLNamespace()];
}

@end
