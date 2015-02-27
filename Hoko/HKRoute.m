//
//  HKRoute.m
//  Hoko
//
//  Created by Hoko, S.A. on 23/07/14.
//  Copyright (c) 2015 Hoko, S.A. All rights reserved.
//

#import "HKRoute.h"

#import "HKApp.h"
#import "HKUtils.h"
#import "HKDevice.h"
#import "HKNetworkOperationQueue.h"

@implementation HKRoute

#pragma mark - Initializer
- (instancetype)initWithRoute:(NSString *)route target:(HKDeeplinkTarget)target {
  self = [super init];
  if (self) {
    _route = route;
    _target = target;
  }
  return self;
}

#pragma mark - Public Static Initializer
+ (instancetype)routeWithRoute:(NSString *)route target:(HKDeeplinkTarget)target{
  return [[HKRoute alloc]initWithRoute:route target:target];
}

#pragma mark - Helper
- (NSArray *)components
{
  return [self.route componentsSeparatedByString:@"/"];
}

#pragma mark - Networking
- (void)postWithToken:(NSString *)token
{
  HKNetworkOperation *networkOperation = [[HKNetworkOperation alloc] initWithOperationType:HKNetworkOperationTypePOST
                                                                                      path:@"routes"
                                                                                     token:token
                                                                                parameters:self.json];
  [[HKNetworkOperationQueue sharedQueue] addOperation:networkOperation];
}

#pragma mark - Serialization
- (id)json
{
  return @{@"route": @{@"build": [HKApp app].build,
                       @"device": [HKDevice device].platform,
                       @"path": self.route,
                       @"url_schemes": [HKApp app].urlSchemes,
                       @"version": [HKApp app].version}};
}


@end