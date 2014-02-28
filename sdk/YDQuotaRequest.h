//
//  YDQuotaRequest.h
//  sdk
//
//  Created by Alexander Shvetsov on 2/28/14.
//  Copyright (c) 2014 Yandex. All rights reserved.
//

#import "YDPROPFINDRequest.h"
#import "YDProp.h"
#import "YDLongLongProp.h"

@interface YDQuotaRequest : YDPROPFINDRequest

+ (YDLongLongProp *)availableBytesProp;
+ (YDLongLongProp *)usedBytesProp;

@end
