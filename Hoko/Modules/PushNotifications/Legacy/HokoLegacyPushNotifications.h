//
//  HokoLegacyPushNotifications.h
//  Hoko
//
//  Created by Hoko, S.A. on 23/07/14.
//  Copyright (c) 2015 Hoko, S.A. All rights reserved.
//

#import "HokoPushNotifications.h"

@interface HokoLegacyPushNotifications : HokoPushNotifications

- (instancetype)initWithToken:(NSString *)token;

@end